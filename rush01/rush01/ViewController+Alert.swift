//
//  ViewController+Alert.swift
//  rush01
//
//  Created by Mykola ZHURBA on 10/12/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
    
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func proposeSetPermission() {
        let alert = UIAlertController(title: "Error", message: "Application has no permision for location. Do you want to turn it in?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (alert) in
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
