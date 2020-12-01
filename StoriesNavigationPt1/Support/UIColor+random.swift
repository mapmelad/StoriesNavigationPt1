//
//  UIColor+random.swift
//  StoriesNavigations
//
//  Created by Semyon on 30.11.2020.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
}
