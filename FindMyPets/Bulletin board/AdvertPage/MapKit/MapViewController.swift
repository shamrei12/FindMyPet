//
//  MapViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 22.01.23.
//

import UIKit
import MapKit
import OpenCageSDK

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let annotations = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMap(adress: String) {
        let ocSDK :OCSDK = OCSDK(apiKey: "6fdde9142f9648378e017befaec8f44c")
        ocSDK.forwardGeocode(address: adress, withAnnotations: true) { [self] (response, success, error) in
            let latitude = Double(truncating: response.locations.first?.latitude ?? 0)
            let longitude = Double(truncating: response.locations.first?.longitude ?? 0)
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.addAnnotation(annotations)
            
            let cameraCenterd = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: cameraCenterd, latitudinalMeters: 10, longitudinalMeters: 10)
            mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
            
            let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 15000)
            mapView.setCameraZoomRange(zoomRage, animated: false)
            mapView.isZoomEnabled = true
        }
    }
    
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
