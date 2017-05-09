//
//  Macros.swift
//  RecMood
//
//  Created by 李亚洲 on 2017/5/9.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

import UIKit

enum RMTheme
{
    typealias RMColor = UInt32
    enum Color : RMColor {
        case primer = 0x0078EF
    }
}

extension UIColor
{
    class func hex(_ hexValue:RMTheme.RMColor) -> UIColor
    {
        return hex(hexValue, alpha: 1)
    }
    
    class func hex(_ hexValue:RMTheme.RMColor, alpha: CGFloat) -> UIColor
    {
        let red = CGFloat( (hexValue & 0xFF0000) >> 16 ) / 255.0
        let green = CGFloat( (hexValue & 0x00FF00) >> 8 )  / 255.0
        let blue = CGFloat( (hexValue & 0x0000FF) )  / 255.0
        
        
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}




