//
//  GeocoderModel.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.01.23.
//

import Foundation
import OpenCageSDK
//
//protocol Geocoder {
//    var adress: String { get set }
//    func adressToСoordinates(adress: String) -> (Double, Double)
//    func coordinatesToAdress(coordinates: (Double, Double)) -> String
//}

class GeocoderModel {
    var adress: String = ""
    let ocSDK :OCSDK = OCSDK(apiKey: "6fdde9142f9648378e017befaec8f44c")
    func adressToСoordinates(adress: String, completion: @escaping (Double, Double) -> Void) {
        
        ocSDK.forwardGeocode(address: adress, withAnnotations: true) { (response, success, error) in
            if success {
                print(response.locations.first?.latitude ?? 0.0)
                completion (Double(truncating: response.locations.first?.latitude ?? 0.0),
                            Double(truncating: response.locations.first?.longitude ?? 0.0))
            } else {
                print("Error")
            }
        }
    }
    
    func coordinatesToAdress(coordinates: (Double, Double), completion: @escaping (String) -> Void) {
        
        ocSDK.reverseGeocode(latitude: NSNumber(value: coordinates.0), longitude: NSNumber(value: coordinates.1), withAnnotations: true) { (response, success, error) in
            if success {
                print(response.locations.first?.formattedAddress ?? "")
                completion(response.locations.first?.formattedAddress ?? "")
            } else {
                print("Error")
            }
        }
    }
//
//    func adressFormated(adress: String, completion: @escaping (String) -> Void) {
//        ocSDK.forwardGeocode(address: adress, withAnnotations: true) { [self] (response, success, error) in
//            if success {
//                let latitude = Double(truncating: response.locations.first?.latitude ?? 0.0)
//                let longtitude = Double(truncating: response.locations.first?.longitude ?? 0.0)
//                print(latitude, longtitude)
//                    ocSDK.reverseGeocode(latitude: NSNumber(value: latitude), longitude: NSNumber(value: longtitude), withAnnotations: true) { (response, success, error) in
//                        if success {
//                            let adressString = response.locations.first?.formattedAddress ?? ""
//                                completion(adressString)
//                            print(adressString)
//                            }
//                        }
//            }
//        }
//    }
}
