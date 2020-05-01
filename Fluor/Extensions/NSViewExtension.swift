//
//  NSViewExtension.swift
//
//  Fluor
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import Cocoa

extension NSView {
    var isDark: Bool {
        if #available(OSX 10.14, *) {
            return effectiveAppearance.bestMatch(from: [.darkAqua,
                                                        .accessibilityHighContrastDarkAqua,
                                                        .vibrantDark,
                                                        .accessibilityHighContrastVibrantDark]) != nil
        } else {
            return false
        }
    }
    
    var isAccessible: Bool {
        if #available(OSX 10.14, *) {
            return effectiveAppearance.bestMatch(from: [.accessibilityHighContrastAqua,
                                                        .accessibilityHighContrastVibrantLight,
                                                        .accessibilityHighContrastDarkAqua,
                                                        .accessibilityHighContrastVibrantDark]) != nil
        } else {
            return false
        }
    }
    
    func centerLayerAnchor() {
        let x = self.frame.midX
        let y = self.frame.midY
        
        self.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.layer?.position = CGPoint(x: x, y: y)
        self.layer?.contentsGravity = CALayerContentsGravity.center
    }
}

