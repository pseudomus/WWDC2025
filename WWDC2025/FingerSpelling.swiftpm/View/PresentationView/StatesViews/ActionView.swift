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
                Image("BaH")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text(text)
                    .font(Font.custom("Poppins-Medium", size: 24, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .multilineTextAlignment(.center)
                    .padding(30)
                
                Text("Let’s try learning spell\nsimple words!")
                    .font(Font.custom("Poppins-SemiBold", size: 32, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .multilineTextAlignment(.center)
                    .padding(30)
                
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

#Preview{
    ActionView(text: """
        Fingerspelling is essential in Deaf education and everyday life. It helps Deaf children connect letters and words to signs, making reading and writing easier to learn. It also aids in learning new sign languages and improves communication between Deaf, mute and hearing people.
        """, action: {print("teste")})
}
