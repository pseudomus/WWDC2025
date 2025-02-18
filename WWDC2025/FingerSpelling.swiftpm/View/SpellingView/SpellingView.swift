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
            FrameView(image: model.frame)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Prediction: \(model.prediction)")
                    .padding(20)
                    .foregroundStyle(.black)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(.white))
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SpellingView()
}
