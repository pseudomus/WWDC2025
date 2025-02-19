//
//  ActionView.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct ActionView: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        ZStack{
            Color.white
            VStack {
                Text(text)
                    .font(Font.custom("Poppins-Medium", size: 24, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Let’s try learning spell\nsimple words!")
                    .font(Font.custom("Poppins-SemiBold", size: 32, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button{
                    action()
                }label: {
                    Image("NextButton")
                }
                .padding()
            }
            
        }.ignoresSafeArea()
    }
}
