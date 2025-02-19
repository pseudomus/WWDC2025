//
//  TitleComponent.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 19/02/25.
//

import SwiftUI

struct TitleComponent: View {
    var body: some View {
        VStack{
            HStack{
                Text("Finger")
                    .font(Font.custom("Poppins-Regular", size: 75, relativeTo: .title))
                    .foregroundStyle(Color("Title1"))
                    .padding(.trailing, 0)
                Text("Spelling")
                    .font(Font.custom("Poppins-Black", size: 75, relativeTo: .title))
                    .foregroundStyle(Color("Title2"))
                    .padding(.leading, 0)
                    .offset(x: -8 , y: 0)
            }
            Text(" Spelling with sign language")
                .font(Font.custom("Poppins-Regular", size: 24, relativeTo: .title))
                .foregroundStyle(Color("Text"))
        }
    }
}
