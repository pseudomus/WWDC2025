//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 18/02/25.
//

import SwiftUI

struct PresentationView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    @StateObject var vm: PresentationViewModel = PresentationViewModel()
    
    var body: some View {
        ZStack{
            Color.white
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}
