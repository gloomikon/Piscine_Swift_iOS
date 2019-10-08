//
//  ViewController.swift
//  d06
//
//  Created by Mykola ZHURBA on 10/8/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        self.gravity = UIGravityBehavior(items: [])
        self.gravity.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        animator.addBehavior(gravity)
        // Do any additional setup after loading the view.
    }

    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let new = Shape(frame: CGRect(x: Int(sender.location(in: self.view).x - 50), y: Int(sender.location(in: self.view).y - 50), width: 100, height: 100))
        self.view.addSubview(new)
        self.gravity.addItem(new)
        print("tapped")
    }
    
}

