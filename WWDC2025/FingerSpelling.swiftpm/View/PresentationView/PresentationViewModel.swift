//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 18/02/25.
//

import Foundation

class PresentationViewModel: ObservableObject {
    @Published var state: PresentationStates = .Explanation
    let imageNames = ["A", "C", "D", "H", "L", "N", "S", "T"]
    
    var explanationText: String {
        """
        Each letter of the alphabet has a specific hand sign, allowing words to be spelled out when there is no designated sign for them.

        This method is especially useful for names, technical terms, and newly created words. Additionally, fingerspelling serves as a bridge between hearing and Deaf individuals, 
        """
    }
    
    var actionText: String {
        """
        Fingerspelling is essential in Deaf education and everyday life. It helps Deaf children connect letters and words to signs, making reading and writing easier to learn. It also aids in learning new sign languages and improves communication between Deaf, mute and hearing people.

        For hearing individuals, learning fingerspelling fosters inclusion and accessibility. 
        """
    }
}
