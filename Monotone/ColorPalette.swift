//
//  ColorPalette.swift
//  Monotone
//
//  Created by Xueliang Chen on 2020/10/31.
//

import Foundation
import UIKit
import Hue

class ColorPalette{
    
    public static func colorWithDarkMode(darkColor:UIColor, lightColor:UIColor) -> UIColor{
        var color:UIColor?
        if #available(iOS 13.0, *){
            color = UIColor.init(dynamicProvider: { (traitCollection:UITraitCollection) -> UIColor in
                if(traitCollection.userInterfaceStyle == .dark){
                    return darkColor
                }
                else{
                    return lightColor
                }
            })
        }
        else{
            color = lightColor
        }
        
        return color!
    }
    
    public static func colorWithDarkMode(darkColorHex:String, lightColorHex:String) -> UIColor{
        var color:UIColor?
        if #available(iOS 13.0, *){
            color = UIColor.init(dynamicProvider: { (traitCollection:UITraitCollection) -> UIColor in
                if(traitCollection.userInterfaceStyle == .dark){
                    return UIColor(hex: darkColorHex)
                }
                else{
                    return UIColor(hex: lightColorHex)
                }
            })
        }
        else{
            color = UIColor(hex: lightColorHex)
        }
        
        return color!
    }
    
    public static var colorBlack:UIColor{
        return self.colorWithDarkMode(darkColorHex: "#ffffff", lightColorHex: "#000000")
    }
    
    public static var colorGrayLighter:UIColor{
        // FIXME: waiting dark color
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#ededed")
    }
    
    public static var colorGrayLight:UIColor{
        // FIXME: waiting dark color
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#9b9b9b")
    }
    
    public static var colorGrayNormal:UIColor{
        // FIXME: waiting dark color
        return self.colorWithDarkMode(darkColorHex: "#000000", lightColorHex: "#999999")
    }
    
    
    // More
    public static var colorDenim:UIColor{
        return self.colorWithDarkMode(darkColorHex: "#3c5080", lightColorHex: "#3c5080")
    }
}