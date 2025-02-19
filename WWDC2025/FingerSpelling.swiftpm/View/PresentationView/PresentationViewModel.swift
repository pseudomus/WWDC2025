//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 18/02/25.
//

import Foundation

class PresentationViewModel: ObservableObject {
    @Published var index:Int = 0
    var presentations:[SceneModel] =
    [
        SceneModel(text: "teste", buttonText: "Avançar"),
        SceneModel(text: "teset2", buttonText: "Avançar")
    ]
    var last:Int
    
    init() {
        last = presentations.count - 1
    }
}
