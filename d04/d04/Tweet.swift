//
//  Tweet.swift
//  d04
//
//  Created by Mykola ZHURBA on 10/5/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    let name: String
    let text: String
    let date: String
    
    var description: String {
        return "\(name) \(text): \(date)"
    }
}
