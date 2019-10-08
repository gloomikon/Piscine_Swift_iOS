//
//  Shape.swift
//  d06
//
//  Created by Mykola ZHURBA on 10/8/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit

enum Shapes {
    case Circle
    case Square
    
    static let allShapes = [Circle, Square]
}

struct Data {
    static let shapes = Shapes.allShapes
    static let colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.black, UIColor.gray, UIColor.orange, UIColor.cyan, UIColor.blue, UIColor.purple]
}
//
//class Shape: UIView {
//
////    let shape: Shapes
////    let color: UIColor
//    var path: UIBezierPath!
//
//    init(origin: CGPoint) {
////        self.shape = Data.shapes[Int(arc4random_uniform(UInt32(Data.shapes.count)))]
////        self.color = Data.colors[Int(arc4random_uniform(UInt32(Data.colors.count)))]
//        super.init(frame: CGRect(x: origin.x - 50, y: origin.y - 50, width: 100, height: 100))
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//
//    override func draw(_ rect: CGRect) {
//        self.path = UIBezierPath(ovalIn: rect)
//        UIColor.orange.setFill()
//        path.fill()
//    }
//
//}

class Shape: UIView {
    var shape: Shapes
    var color: UIColor
    var path: UIBezierPath!
    var itemBehavior: UIDynamicItemBehavior?
    
    override init(frame: CGRect) {
        self.shape = Data.shapes[Int(arc4random_uniform(UInt32(Data.shapes.count)))]
        self.color = Data.colors[Int(arc4random_uniform(UInt32(Data.colors.count)))]
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.path = self.shape == .Circle ? UIBezierPath(ovalIn: rect) : UIBezierPath(rect: rect)
        self.color.setFill()
        path.fill()
    }
}
