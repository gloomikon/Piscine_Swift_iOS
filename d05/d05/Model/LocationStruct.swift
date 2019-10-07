//
//  LocationStruct.swift
//  d05
//
//  Created by Mykola ZHURBA on 10/7/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import Foundation

struct Location {
    let latitude: Double
    let longitude: Double
    let name: String
    let description: String
}


let places = [
    Location(latitude: 50.468939, longitude: 30.462153, name: "Unit Factory", description: "Ukrainian National IT Factory"),
    Location(latitude: 50.410320, longitude: 30.637164, name: "Home", description: "Home is the place where, when you have to go there, they have to take you in"),
    Location(latitude: 50.447378, longitude: 30.455780, name: "KPI", description: "Igor Sikorsky Kyiv Polytechnic Institute"),
    Location(latitude: 48.896661, longitude: 2.318493, name: "Ecole 42", description: "42 is a private, nonprofit and tuition-free computer programming school")
]
