//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 17/02/25.
//

import SwiftUI

enum Screen: Identifiable, Hashable {
    case home
    case pressentation
    case camera
    
    var id: Self { return self }
}
