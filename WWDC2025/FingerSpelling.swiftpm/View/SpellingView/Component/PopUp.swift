//
//  PopUp.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct PopUp: View {
    
    var title: String
    var text:String
    var symbol:String
    var action:()->Void
    
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                
                ZStack{
                    Image("Confete")
                    Text("Congratulations")
                        .font(Font.custom("Poppins-Bold", size: 32, relativeTo: .title))
                        .foregroundStyle(Color("Title2"))
                        .frame(width: 400, height: 15, alignment: .leading)
                        .padding()
                        .padding(.top, 20)
                }
                
                VStack{
                    Text(title)
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("Poppins-Bold", size: 24, relativeTo: .title))
                        .foregroundStyle(Color("Title1"))
                        .frame(width: 370, height: 65, alignment: .leading)
                    
                    
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("Poppins-Regular", size: 20, relativeTo: .title))
                        .foregroundStyle(Color("Text"))
                        .padding()
                }
            }
            .padding(30)
            .frame(width: 477, height: 500)
            
            switch symbol {
                
            case "cat.fill":
                Image(systemName: "\(symbol)")
                    .resizable()
                    .frame(width: 81,height: 60)
                    .foregroundStyle(Color("Symbol"))
                    .scaledToFill()
            case "face.smiling.inverse":
                Image(systemName: "\(symbol)")
                    .resizable()
                    .frame(width: 61,height: 60)
                    .foregroundStyle(Color("Symbol"))
                    .scaledToFill()
            case "Hand":
                Image("\(symbol)")
                    .resizable()
                    .frame(width: 120,height: 86)
                    .foregroundStyle(Color("Symbol"))
                    .scaledToFit()
                
            default:
                Text("Failed to find corresponding asset")
            }
            
            
            Button{
                action()
            }label: {
                Image("NextButton")
                    .padding(10)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 477, height: 730)
                .foregroundStyle(Color.white)
            
        }
    }
}

#Preview {
    PopUp(title: "Cats can understand ASL!", text: """
            Contrary to what many people think, hands are not the main part of sign language. The face is essential for conveying emotions and feelings, beyond just words.
            """,
          symbol: "face.smiling.inverse",action: {print("Preview")}
    )
}
