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
            if let image = vm.presentations[vm.index].image{
                image
                    .resizable()
                    .scaledToFit()
            }
            Text(vm.presentations[vm.index].text)
            
            Button{
                if vm.index < vm.presentations.count - 1{
                    withAnimation {
                        vm.index += 1
                    }
                } else {
                    appCoordinator.push(.camera)
                }
            }label: {
                Text(vm.presentations[vm.index].buttonText)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
