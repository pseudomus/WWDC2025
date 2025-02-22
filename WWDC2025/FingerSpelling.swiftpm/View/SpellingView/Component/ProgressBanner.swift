//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct ProgressBanner:View {
    
    var word:[String]
    var stage:Int
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<word.count, id: \.self) { index in
                    if index < stage {
                        
                        VStack{
                            Text(word[index])
                                .font(Font.custom("Poppins-Medium", size: 64, relativeTo: .title))
                                .foregroundStyle(Color("Text"))
                                .padding(5)

                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 78, height: 13)
                                .foregroundStyle(Color("Title2"))
                        }
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                    } else {
                        
                        VStack{
                            Text(word[index])
                                .font(Font.custom("Poppins-Medium", size: 64, relativeTo: .title))
                                .foregroundStyle(Color("Text"))
                                .opacity(0.4)
                                .padding(5)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 78, height: 13)
                                .opacity(0.4)
                                .foregroundStyle(Color("Text"))
                        }
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                    }
                    
                        
                }.padding(.bottom,20)
            }
            if stage == word.count {
                Image(word[stage-1])
            } else {
                Image(word[stage])
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(Color.white)
                .frame(width: 517, height: 300)
        }
    }
}

#Preview {
    ProgressBanner(word: ["C","A","T"], stage: 1)
}
