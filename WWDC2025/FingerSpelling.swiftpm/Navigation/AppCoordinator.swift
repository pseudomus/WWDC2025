//
//  AppCoordinator.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 17/02/25.
//

import SwiftUI

class AppCoordinatorImpl: AppCoordinatorProtocol {
    @Published var path: NavigationPath = NavigationPath()
    
    // MARK: - Navigation Functions
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    // MARK: - Presentation Style Providers
    @MainActor @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .home:
            MainMenuView()
        case .camera:
            SpellingView()
        case .pressentation:
            PresentationView()
        }
    }
}
