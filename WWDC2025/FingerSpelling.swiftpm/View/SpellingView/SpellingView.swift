//
//  StartView.swift
//  WWDC25
//
//  Created by Luca Lacerda on 15/02/25.
//

import SwiftUI

struct SpellingView: View {
    
    @StateObject private var model = CameraModel()
    
    var body: some View {
        ZStack{
            Color.black
            
            FrameView(image: model.frame)
                .ignoresSafeArea()
            
            VStack{
                if model.showTutorial == false {
                    if model.showEnd == true {
                        
                        Color.black
                        
                        
                    } else {
                        if model.showPopUp == true {
                            
                            PopUp(text: model.popUpText[model.wordCount], action: {
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
            
            VStack {
                Spacer()
                Text("Prediction: \(model.prediction)")
                    .padding(20)
                    .foregroundStyle(.black)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(.white))
            }
            
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
