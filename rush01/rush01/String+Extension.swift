//
//  String+Extension.swift
//  rush01
//
//  Created by Mykola ZHURBA on 10/13/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
        
    }
}
