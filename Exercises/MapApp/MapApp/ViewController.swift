//
//  ViewController.swift
//  MapApp
//
//  Created by Jeet, Chandan on 06.04.22.
//

import UIKit
import MapKit

let latAmsterdam = 52.3702
let lonAmsterdam = 4.8952

class ViewController: UIViewController,CLLocationManagerDelegate {

    
    
    
    
    
    let locationManager = CLLocationManager()
    var initialRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latAmsterdam, longitude: lonAmsterdam),span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let mapType = sender.selectedSegmentIndex
        switch mapType{

        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = MKMapType.satellite
        case 2: mapView.mapType = MKMapType.hybrid
        case 3: mapView.mapType = MKMapType.satelliteFlyover
        case 4: mapView.mapType = MKMapType.mutedStandard
        default: mapView.mapType = MKMapType.standard
            
            
        }
        self.mapView.setNeedsFocusUpdate()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        locationManager.delegate = self
        // this what we see on startup
        
        mapView.setRegion(initialRegion, animated: true)
        //
        // This is essential, the location sysyem wil not allow us to get into otherwise
        //
        locationManager.requestAlwaysAuthorization()
        //
        //
        
        mapView.showsUserLocation = true
        
      
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLoactions location: [CLLocation]) {
        if let newCenter = location.last?.coordinate {
            let newRegion = MKCoordinateRegion(center: newCenter, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            
            mapView.setRegion(newRegion, animated: true)
            //self.view.setNeedsDisplay()
            print("Location update on first view controller")

        
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("shite man")
        
    }
}
    


