//
//  StartView.swift
//  WWDC25
//
//  Created by Luca Lacerda on 15/02/25.
//

import SwiftUI

struct SpellingView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    @StateObject private var model = CameraModel()
    
    var body: some View {
        ZStack{
            Color.black
            
            FrameView(image: model.frame)
                .ignoresSafeArea()
            
            VStack{
                if model.showTutorial == false {
                    if model.showEnd == true {
                        
                        EndPopUp {
                            appCoordinator.popToRoot()
                        }
                        
                        
                    } else {
                        if model.showPopUp == true {
                            
                            PopUp(title: model.popUpText[model.wordCount].title
                                  , text: model.popUpText[model.wordCount].message, symbol: model.popUpText[model.wordCount].symbol, action: {
                                print("\(model.wordCount)")
                                if model.wordCount == model.words.count-1 {
                                    print("terminou")
                                    model.showEnd.toggle()
                                }else {
                                    model.showPopUp.toggle()
                                    model.wordCount += 1
                                }
                                
                            })
                        } else {
                            ProgressBanner(word: model.words[model.wordCount].word, stage:  model.words[model.wordCount].stage)
                                .padding()
                            Spacer()
                        }
                        
                        
                    }
                }
            }
            
//            VStack {
//                Spacer()
//                Text("Prediction: \(model.prediction)")
//                    .padding(20)
//                    .foregroundStyle(.black)
//                    .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(.white))
//            }
            
            if model.showTutorial == true{
                TutorialPopUp {
                    withAnimation {
                        model.showTutorial = false
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SpellingView()
}
