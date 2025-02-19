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
        
        
        VStack{
            switch vm.state {
            case .Explanation:
                ExplanationView(array: vm.imageNames,text: vm.explanationText) {
                    withAnimation{
                        vm.state = .Action
                    }
                }
            case .Action:
                ActionView(text: vm.actionText) {
                    appCoordinator.push(.camera)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
