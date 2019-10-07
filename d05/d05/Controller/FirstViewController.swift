//
//  FirstViewController.swift
//  d05
//
//  Created by Mykola ZHURBA on 10/7/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.tabBarController?.viewControllers![1] as! SecondViewController
        self.tabBarController?.selectedViewController = vc
        vc.gotoCoords(latitude: places[indexPath.row].latitude, longitude: places[indexPath.row].longitude)
    }
    
}
