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
            
            
            Image("MainBack")
            
            VStack {
                Spacer()
                
                TitleComponent()
                    .padding(60)
                
                Image("StartButton")
                    .onTapGesture {
                        withAnimation {
                            appCoordinator.push(.pressentation)
                        }
                    }
                    .padding(200)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
