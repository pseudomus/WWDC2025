//
//  FrameVioew.swift
//  WWDC25
//
//  Created by Luca Lacerda on 15/02/25.
//

import SwiftUI

struct FrameView: View {
    var image: UIImage?
    private let label = Text("frame")
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        } else {
            Color.black
        }
    }
}

#Preview {
    FrameView()
}
