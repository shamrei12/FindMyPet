////
////  LocationManager.swift
////  FindMyPets
////
////  Created by Алексей Шамрей on 22.01.23.
////
//
//import Foundation
//import CoreLocation
//
//final class LocationManager: NSObject, CLLocationManagerDelegate {
//    let locationManager: CLLocationManager
//    static var shared: LocationManager = {
//        let instance = LocationManager()
//        return instance
//    }()
//
//    private var completionHandler: ((_ location: CLLocation) -> Void)?
//
//    override init() {
//        locationManager = CLLocationManager()
//        super.init()
//        locationManager.delegate = self
//    }
//
//    func getCurrentLocation(_ completion: @escaping (_ location: CLLocation) -> Void) {
//        completionHandler = completion
//        locationManager.requestLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            completionHandler?(location)
//            completionHandler = nil
//        }
//    }
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
//}
