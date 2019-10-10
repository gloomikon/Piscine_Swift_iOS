//
//  ViewController.swift
//  d07
//
//  Created by Mykola ZHURBA on 10/10/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO
import CoreLocation
import JSQMessagesViewController

class ViewController: UIViewController {
    var bot : RecastAIClient?
    var client : DarkSkyClient?
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var outputText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bot = RecastAIClient(token : "4bc9651cc1dc91a9808fc77a9b1c8962", language: "en")
        self.client = DarkSkyClient(apiKey: "bdd66f06868425fe86f8b98270d7da67")
        self.client?.units = .si
    }

    @IBAction func makeRequest(_ sender: UIButton) {
        if (inputText.text != "") {
            self.bot?.textRequest(inputText.text!, successHandler: successHandler, failureHandle: {
                (err) in
                print(err.localizedDescription)
            })
        } else {
            displayError(message: "Field can not be blank")
        }
    }
    
    private func successHandler(response : Response) {
        if let location = response.get(entity: "location") {
            print(location)
            if let city = location["city"] as? String {
                self.outputText.text = "Weather in \(city) is "
            } else if let formatted = location["formatted"] as? String {
                self.outputText.text = "Weather in \(formatted) is "
            }
            let myLoc = CLLocationCoordinate2D(latitude: location["lat"]! as! CLLocationDegrees, longitude: location["lng"]! as! CLLocationDegrees)
            self.client!.getForecast(location: myLoc, completion: completion)
        } else {
            displayError(message: "Invalid place")
        }
    }
    
    private func completion(result: Result<(Forecast, RequestMetadata), Error>) {
        switch result {
        case .success(let currentForecast, let requestMetadata):
            print(currentForecast)
            print(requestMetadata)
            DispatchQueue.main.async {
                self.outputText.text = self.outputText.text! + String(describing: currentForecast.currently!.summary!) + "\nTemperature is \(String(describing: currentForecast.currently!.temperature!))°C"
            }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

extension UIViewController {
    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
