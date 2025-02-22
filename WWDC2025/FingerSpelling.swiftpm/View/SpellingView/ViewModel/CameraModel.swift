import SwiftUI
import AVFoundation
import Vision
import CoreML

class CameraModel: NSObject, ObservableObject {
    @Published var words: [WordsModel] = [
        WordsModel(word: ["C","A","T"], stage: 0),
        WordsModel(word: ["A","S","L"], stage: 0),
        WordsModel(word: ["H","A","N","D"], stage: 0)
    ]
    @Published var showTutorial: Bool = true
    @Published var wordCount: Int = 0
    @Published var frame: UIImage?
    @Published var showPopUp: Bool = false
    @Published var showEnd: Bool = false
    var popUpText:[PopUpModel] = [
        
        PopUpModel(title: "Cats can understand ASL!", message: """
Many Deaf families train their cats to recognize ASL signs, especially for commands like approaching or moving to a specific location.
""", symbol: "cat.fill"),
        
        PopUpModel(title: "ASL is not universal", message: """
                    Many people think there is only one universal sign language, but each country or region may have its own.
                    """, symbol: "cat.fill"),
        
        PopUpModel(title: "Hand is only one part of ASL", message: """
                   Contrary to what many people think, hands are not the main part of sign language. The face is essential for conveying emotions and feelings, beyond just words.
                   """, symbol: "face.smiling.inverse")
        
    ]
    private var isProcessing = false
    
    private var captureSession = AVCaptureSession()
    private var videoOutput = AVCaptureVideoDataOutput()
    private var context = CIContext()
    private var frontCamera: AVCaptureDevice?
    private var backInput: AVCaptureDeviceInput?
    private var queue = DispatchQueue(label: "com.cameraQueue.nano05", qos: .userInitiated, attributes: .concurrent)
    
    var prediction: String = "" {
        didSet {
            
            if  words[wordCount].stage < words[wordCount].word.count {
                if prediction == words[wordCount].word[words[wordCount].stage] {
                    
                    words[wordCount].stage += 1
                    
                    if words[wordCount].stage == words[wordCount].word.count {
                        self.showPopUp.toggle()
                        
                        if wordCount == words.count {
                            print("Terminou")
                        }
                    }
                }
            }
        }
    }
    
    override init() {
        super.init()
        checkPermission()
        setupCaptureSession()
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { authorized in
                if !authorized {
                    self.checkPermission()
                }
            }
        default:
            self.checkPermission()
        }
    }
    
    func setupCaptureSession() {
        queue.async {
            self.captureSession.beginConfiguration()
            
            if self.captureSession.canSetSessionPreset(.photo) {
                self.captureSession.sessionPreset = .photo
            }
            
            self.captureSession.automaticallyConfiguresCaptureDeviceForWideColor = true
            self.setupInputs()
            self.setupOutputs()
            
            self.captureSession.commitConfiguration()
            self.captureSession.startRunning()
        }
    }
    
    func setupOutputs() {
        let videoQueue = DispatchQueue(label: "videoQueue", qos: .userInitiated)
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            fatalError("Erro ao adicionar saída de vídeo")
        }
        
        if #available(iOS 17.0, *) {
            videoOutput.connections.first?.videoRotationAngle = 90
        } else {
            videoOutput.connection(with: .video)?.videoOrientation = .portrait
        }
    }
    
    func setupInputs() {
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
            fatalError("Câmera frontal não encontrada")
        }
        
        self.frontCamera = device
        guard let bInput = try? AVCaptureDeviceInput(device: self.frontCamera!) else {
            fatalError("Erro ao criar entrada da câmera")
        }
        
        backInput = bInput
        if !captureSession.canAddInput(backInput!) {
            fatalError("Erro ao adicionar entrada de câmera")
        }
        
        captureSession.addInput(backInput!)
    }
    
    func stopSession() {
        self.captureSession.stopRunning()
    }
    
//    func extractHandKeypoints(from observations: [VNHumanHandPoseObservation]?) -> [CGPoint]? {
//        guard let observations = observations, let firstObservation = observations.first else {
//            return nil
//        }
//        
//        do {
//            let allPoints = try firstObservation.recognizedPoints(.all)
//            return allPoints.map { $0.value.location }
//        } catch {
//            print("Erro ao extrair pontos-chave: \(error)")
//            return nil
//        }
//    }
    
    func convertToPercentage(_ value: Double) -> String {
        return String(format: "%.1f%%", value * 100)
    }
}

extension CameraModel: AVCaptureVideoDataOutputSampleBufferDelegate{
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        connection.isVideoMirrored = true
        guard let uiImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else {return}
        DispatchQueue.main.async { [unowned self] in
            self.frame = uiImage
        }
        
        guard !isProcessing else { return } // Skip if already processing
        isProcessing = true
        
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1.0) {
            self.isProcessing = false
        }
        
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        let handPoseRequest = VNDetectHumanHandPoseRequest()
        handPoseRequest.maximumHandCount = 1
        handPoseRequest.revision = VNDetectContourRequestRevision1
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try handler.perform([handPoseRequest])
        } catch {
            assertionFailure("Human Pose Request failed: \(error.localizedDescription)")
        }
        
        guard let handPoses = handPoseRequest.results, !handPoses.isEmpty else {
            return
        }
        
        let handObservations = handPoses.first
        
        
        guard let keypointsMultiArray = try? handObservations!.keypointsMultiArray() else {
            fatalError("Failed to create key points array")
        }
        
        guard self.wordCount != words.count else { return }
        do {
            let config = MLModelConfiguration()
            config.computeUnits = .cpuAndGPU
            let model = try FingerSpellingModel.init(configuration: config)
            
            let handPosePrediction = try model.prediction(poses: keypointsMultiArray)
            //            DispatchQueue.main.async { [weak self] in
            //                guard let self = self else { return }
            //                self.thirdLabel.text = "\(self.convertToPercentage(confidence))%"
            //            }
            if let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label] {
                print("Predicted Gesture: \(handPosePrediction.label) with Confidence: \(convertToPercentage(confidence))")
                
                // Debugging: Print all probabilities
                for (label, probability) in handPosePrediction.labelProbabilities.sorted(by: { $0.value > $1.value }) {
                    print("\(label): \(convertToPercentage(probability))")
                }
                
                // Apply confidence threshold
                if confidence > 0.80 {
                    print("High confidence detected gesture: \(handPosePrediction.label)")
                    self.prediction = handPosePrediction.label
                } else {
                    print("Low confidence: \(handPosePrediction.label)")
                }
            } else {
                print("Confidence score not found for \(handPosePrediction.label)")
            }
            
        } catch let error {
            print("Failure HandyModel: \(error.localizedDescription)")
        }
    }
    
    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return nil}
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {return nil}
        let uiImage = UIImage(cgImage: cgImage)
        return uiImage
    }
}


extension CameraModel: @unchecked Sendable {}
