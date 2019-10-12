//
//  SecondViewController.swift
//  rush01
//
//  Created by Mykola ZHURBA on 10/12/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController {
    @IBOutlet weak var source: UISearchBar!
    @IBOutlet weak var destination: UISearchBar!
    var sourceLocation: CLLocationCoordinate2D?
    var destLocation: CLLocationCoordinate2D?
    
    let geoCoder = CLGeocoder()
    let geoCoder2 = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func swap(_ sender: UIButton) {
    }
    
    @IBAction func buildPath(_ sender: UIButton) {
        
        print("fgh")
        if (source.text == "") {
            let vc = tabBarController?.viewControllers![0] as! FirstViewController
            sourceLocation = vc.locationManager.location!.coordinate
            self.geoCoder2.geocodeAddressString(self.destination.text!) {
                (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        self.displayAlert(message: "No destination address found")
                        return
                }
                self.destLocation = location.coordinate
                let vc = self.tabBarController?.viewControllers![0] as! FirstViewController
                self.tabBarController?.selectedViewController = vc
                vc.buildPath(source: self.sourceLocation!, dest: self.destLocation!)
            }
        } else {
            geoCoder.geocodeAddressString(source.text!) {
                (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        self.displayAlert(message: "No source address found")
                        return
                }
                self.sourceLocation = location.coordinate
                self.geoCoder2.geocodeAddressString(self.destination.text!) {
                    (placemarks, error) in
                    guard
                        let placemarks = placemarks,
                        let location = placemarks.first?.location
                        else {
                            self.displayAlert(message: "No destination address found")
                            return
                    }
                    self.destLocation = location.coordinate
                    let vc = self.tabBarController?.viewControllers![0] as! FirstViewController
                    self.tabBarController?.selectedViewController = vc
                    vc.buildPath(source: self.sourceLocation!, dest: self.destLocation!)
                }
            }
        }
    }
}

