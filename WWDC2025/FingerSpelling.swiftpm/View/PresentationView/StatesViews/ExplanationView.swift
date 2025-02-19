//
//  ExplanationView.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct ExplanationView: View {
    
    var array: [String]
    var text: String
    var action: ()->Void
    
    var body: some View {
        
        ZStack {
            Color.white
            VStack{
                HStack{
                    ForEach(0..<4, id: \.self){ i in
                        VStack{
                            Image(array[i])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 121, height: 121)
                            Text(array[i])
                                .font(Font.custom("Poppins-SemiBold", size: 36, relativeTo: .title))
                                .foregroundStyle(Color("Title2"))
                        }
                        .padding(30)
                    }
                }
                HStack {
                    ForEach(4..<8, id: \.self){ i in
                        VStack{
                            Image(array[i])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 121, height: 121)
                            Text(array[i])
                                .font(Font.custom("Poppins-SemiBold", size: 36, relativeTo: .title))
                                .foregroundStyle(Color("Title2"))
                        }
                        .padding(30)
                    }
                }
                
                Text(text)
                    .font(Font.custom("Poppins-Medium", size: 22, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .padding(.top, 60)
                    .padding(.trailing,20)
                    .padding(.leading,20)
                
                
                Text("enhancing communication and inclusion.")
                    .font(Font.custom("Poppins-Bold", size: 22, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("Text"))
                    .padding(.bottom, 40)
                
                Button{
                    action()
                }label: {
                    Image("NextButton")
                        .padding(.top,50)
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ExplanationView(array: ["A", "C", "D", "H", "L", "N", "S", "T"], text: """
            Each letter of the alphabet has a specific hand sign, allowing words to be spelled out when there is no designated sign for them.

            This method is especially useful for names, technical terms, and newly created words. Additionally, fingerspelling serves as a bridge between hearing and Deaf individuals, 
        """,action: {print("teste")}
    )
}
