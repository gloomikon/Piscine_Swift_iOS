//
//  FirstViewController.swift
//  rush01
//
//  Created by Mykola ZHURBA on 10/12/19.
//  Copyright © 2019 Mykola ZHURBA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    var route: MKRoute!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentController.layer.cornerRadius = 10
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func searchPlace(_ sender: Any) {
        if (textField.text == "") {
            displayAlert(message: "Field can not be empty")
        } else {
            self.geoCoder.geocodeAddressString(textField.text!) {
                (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        self.displayAlert(message: "No destination address found")
                        return
                }
                self.addAnnotation(location: location)
            }
        }
    }
    
    @IBAction func gotoCurrentLocation(_ sender: UIButton) {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            proposeSetPermission()
        } else {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func addAnnotation(location: CLLocation) {
        mapView.removeAnnotations(mapView.annotations)
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        pin.title = textField.text!.lowercased().capitalized
        pin.subtitle = "\(location.coordinate.latitude) \(location.coordinate.longitude)"
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
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
    func buildPath(source: CLLocationCoordinate2D, dest: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: source, span: span)
        mapView.setRegion(region, animated: true)
        for overlay in self.mapView.overlays {
            mapView.removeOverlay(overlay)
        }
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: dest))
        directionsRequest.transportType = MKDirectionsTransportType.automobile
        let directions = MKDirections(request: directionsRequest)
        directions.calculate(completionHandler: {
            response, error in
            if error == nil {
                self.route = response!.routes[0] as MKRoute
                self.mapView.addOverlay(self.route.polyline)
            } else {
                self.displayAlert(message: "Directions Not Available")
            }
        })
        }
}

extension FirstViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
}

extension FirstViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//        let reuseId = "pin"
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//        pinView?.pinTintColor = .orange
//        pinView?.canShowCallout = true
//        let smallSquare = CGSize(width: 30, height: 30)
//        let button = UIButton(frame: CGRect(origin: CGPoint.zero, size: smallSquare))
//        button.setBackgroundImage(UIImage(named: "car"), for: .normal)
//        button.addTarget(self, action: #selector(getDirections), for: .touchUpInside)
//        pinView?.leftCalloutAccessoryView = button
//        return pinView
//    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) ->MKOverlayRenderer {
        let myLineRenderer = MKPolylineRenderer(polyline: route.polyline)
        myLineRenderer.strokeColor = .blue
        myLineRenderer.lineWidth = 3
        return myLineRenderer
    }
}
