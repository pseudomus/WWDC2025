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
        }
    }
}
