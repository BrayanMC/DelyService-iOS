//
//  UIColor+.swift
//  DelyService
//
//  Created by Brayan Munoz Campos on 5/5/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import UIKit

extension UIColor {
    
    public static let redF96363 = UIColor.init(hexString: .HEXF96363)
    public static let gradientStart51EFF5 = UIColor.init(hexString: .HEX51EFF5)
    public static let gradientEnd6AD20F = UIColor.init(hexString: .HEX6AD20F)
    public static let borderEFEFEF = UIColor.init(hexString: .HEXEFEFEF)
    public static let offer00CB2C = UIColor.init(hexString: .HEX00CB2C)
    
    convenience init(hexString: ColorHex) {
        let hex = hexString.rawValue.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
