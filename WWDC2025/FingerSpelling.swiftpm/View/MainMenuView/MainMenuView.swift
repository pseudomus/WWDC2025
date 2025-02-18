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
                    .foregroundStyle(.black)
                    .onTapGesture {
                        withAnimation {
                            appCoordinator.push(.camera)
                        }
                    }
            }
        }.ignoresSafeArea()
    }
}
