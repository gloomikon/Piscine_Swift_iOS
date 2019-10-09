//
//  UIColorRandom.swift
//  d06
//
//  Created by Mykola ZHURBA on 10/9/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
