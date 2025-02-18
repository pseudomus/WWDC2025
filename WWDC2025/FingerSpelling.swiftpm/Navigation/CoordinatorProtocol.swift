//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 17/02/25.
//

import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
}
