//
//  File.swift
//  FingerSpelling
//
//  Created by Luca Lacerda on 18/02/25.
//

import SwiftUI

public struct MyFont {
    public static func registerFonts() {
        registerFont(bundle: Bundle.main , fontName: "Poppins-Black", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main , fontName: "Poppins-Regular", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main , fontName: "Poppins-Bold", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main , fontName: "Poppins-Medium", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main , fontName: "Poppins-SemiBold", fontExtension: ".ttf")
        //change according to your ext.
    }
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
