//
//  PopUp.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct PopUp: View {
    
    var text:String
    var action:()->Void
    
    var body: some View {
        VStack{
            VStack{
                Text("Congratulations")
                    .font(Font.custom("Poppins-Regular", size: 54, relativeTo: .title))
                    .foregroundStyle(Color("Title2"))
                    .padding()
                Text(text)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Poppins-Regular", size: 20, relativeTo: .title))
                    .foregroundStyle(Color("Text"))
                    .frame(width: 440, height: 140)
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

#Preview {
    PopUp(text: """
            Many Deaf families train their cats to
            recognize ASL signs, especially for 
            commands like approaching or 
            moving to a specific location.
            """,
          action: {print("Preview")}
    )
}
