//
//  SessionManager.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 21.01.23.
//

import Foundation
import OpenCageSDK


class SessionManager {
    static var shared: SessionManager = {
        let instance = SessionManager()
        return instance
    }()
    
    private init() {}
    
    func getCoord(adress: String, dataResponse: @escaping (OCGeoResponse) -> Void) {
        let ocSDK :OCSDK = OCSDK(apiKey: "6fdde9142f9648378e017befaec8f44c")
        ocSDK.forwardGeocode(address: adress, withAnnotations: true) { (response, success, error) in

        }

    }
}
