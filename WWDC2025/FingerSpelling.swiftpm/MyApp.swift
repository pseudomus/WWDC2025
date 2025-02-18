import SwiftUI
import UIKit
import CoreText

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .preferredColorScheme(.dark)
        }
    }
}
