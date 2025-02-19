//
//  MenuView.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 17/02/25.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("FingerSpelling")
                    .font(Font.custom("Poppins-Regular", size: 32, relativeTo: .title))
                    .foregroundStyle(.black)
                    .onTapGesture {
                        withAnimation {
                            appCoordinator.push(.pressentation)
                        }
                    }
            }
        }.ignoresSafeArea()
    }
}
