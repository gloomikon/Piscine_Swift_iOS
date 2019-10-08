//
//  LocationStruct.swift
//  d05
//
//  Created by Mykola ZHURBA on 10/7/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit

struct Location {
    let latitude: Double
    let longitude: Double
    let name: String
    let description: String
    let color: UIColor
}

let places = [
    Location(latitude: 50.468939, longitude: 30.462153, name: "Unit Factory", description: "Ukrainian National IT Factory", color: .blue),
    Location(latitude: 50.410320, longitude: 30.637164, name: "Home", description: "Home is a person and I'm finally home", color: .green),
    Location(latitude: 50.447378, longitude: 30.455780, name: "KPI", description: "Igor Sikorsky Kyiv Polytechnic Institute", color: .red),
    Location(latitude: 48.896661, longitude: 2.318493, name: "Ecole 42", description: "42 is a computer programming school", color: .yellow)
]
