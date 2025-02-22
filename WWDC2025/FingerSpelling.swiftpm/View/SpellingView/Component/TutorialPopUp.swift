//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct TutorialPopUp: View {
    
    var action: ()->Void
    
    var body: some View {
        VStack{
            VStack{
               
                Text("""
                     • Make sure your hand is fully visible and close to the camera
                     
                     • A word will appear at the top of the screen, and below it, you’ll see the fingerspelling sign to replicate.

                     • Once you make the correct sign, the next one will appear automatically until you complete the word. 
                    """)
                .multilineTextAlignment(.leading)
                    .font(Font.custom("Poppins-Regular", size: 20, relativeTo: .title))
                    .foregroundStyle(Color("Text"))
                    .frame(width: 440)
                    .padding()
            }.padding(30)
            
            Button{
                action()
            }label: {
                Image("NextButton")
                    .padding(30)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 477, height: 520)
                .foregroundStyle(Color.white)
        
        }
    }
}

#Preview{
    TutorialPopUp(action: {})
}
