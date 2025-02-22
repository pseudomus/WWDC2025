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
                        .padding(.top, 40)
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
                    .frame(width: 101,height: 86)
                    .foregroundStyle(Color("Symbol"))
                    .scaledToFill()
                
            default:
                Text("Failed to find corresponding asset")
            }
            
            
            Button{
                action()
            }label: {
                Image("NextButton")
                    .padding(30)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 477, height: 700)
                .foregroundStyle(Color.black)
            
        }
    }
}

#Preview {
    PopUp(title: "Cats can understand ASL!", text: """
            Many Deaf families train their cats to
            recognize ASL signs, especially for 
            commands like approaching or 
            moving to a specific location.
            """,
          symbol: "face.smiling.inverse",action: {print("Preview")}
    )
}
