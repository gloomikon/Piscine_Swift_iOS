//
//  SecondViewController.swift
//  d05
//
//  Created by Mykola ZHURBA on 10/7/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MyPointAnnotation : MKPointAnnotation {
    var pinTintColor: UIColor?
}

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var autoLocationBtn: UIButton!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.layer.cornerRadius = 4
        addPins()
        gotoCoords(latitude: 48.896661, longitude: 2.318493)
        autoLocation()
    }
    
    @IBAction func updateMapType(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex) {
        case "Standard":
            mapView.mapType = MKMapType.standard
        case "Satellite":
            mapView.mapType = MKMapType.satellite
        case "Hybrid":
            mapView.mapType = MKMapType.hybrid
        default:
            break ;
        }
    }
    
    @IBAction func updateLocation(_ sender: Any) {
        if (CLLocationManager.authorizationStatus() != .authorizedWhenInUse) {
            let alert = UIAlertController(title: "Error", message: "Can not update location because application has no permission", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true)
        } else {
            let region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
        }
    }
    
    func gotoCoords(latitude: Double, longitude: Double) {
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01));
        mapView.setRegion(region, animated: false)
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsUserLocation = true
    }
    
    private func addPins() {
        for place in places {
            let pin = MyPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            pin.title = place.name
            pin.subtitle = place.description
            pin.pinTintColor = .green
            mapView.addAnnotation(pin)
        }
    }
}

extension SecondViewController: CLLocationManagerDelegate {
    private func autoLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
}

extension SecondViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin");
        view.canShowCallout = true;
        view.calloutOffset = CGPoint(x: -5, y: 5);
        for place in places {
            if (place.latitude == annotation.coordinate.latitude
            && place.longitude == annotation.coordinate.longitude) {
                view.pinTintColor = place.color;
                break;
            }
        }
        return (view);
    }
}
