import SwiftUI
import UIKit
import CoreText

@main
struct MyApp: App {
    
    init() {
        MyFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .preferredColorScheme(.dark)
                .onAppear {
                    let fontFamilyNames = UIFont.familyNames
                    for familyName in fontFamilyNames {
                        print("Font Family Name = [\(familyName)]")
                        let names = UIFont.fontNames(forFamilyName: familyName)
                        print("Font Names = [\(names)]")
                    }
                }
        }
    }
}
