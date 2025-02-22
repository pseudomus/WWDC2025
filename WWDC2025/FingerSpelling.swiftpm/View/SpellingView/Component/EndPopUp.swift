//
//  EndPopUp.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 22/02/25.
//

import SwiftUI

struct EndPopUp: View {
    
    var message:String = """
Now that you’ve seen how possible it is to learn fingerspelling, why not take it further?

 You can practice the entire alphabet, learn common expressions, or pick up essential vocabulary to use in your daily life and at work.

Want to practice again?
"""
    var action:()->Void
    
    var body: some View {
        VStack {
            Image("Confete2")
            
            Text("Learn ASL is possible!")
                .font(Font.custom("Poppins-Bold", size: 32, relativeTo: .title))
                .foregroundStyle(Color("Title2"))
                .frame(width: 400, height: 15, alignment: .leading)
            
            Text(message)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Poppins-Regular", size: 20, relativeTo: .title))
                .foregroundStyle(Color("Text"))
                .frame(width: 400, height: 320, alignment: .leading)
                .padding(10)
            
            Image("RestartButton")
                .padding(.bottom,30)
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 477, height: 680)
                .foregroundStyle(Color.white)
            
        }
    }
}

#Preview {
    EndPopUp(action: {print("preview")})
}
