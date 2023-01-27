//import Foundation
//import Alamofire
//
//
//class SessionManager {
//    static var shared: SessionManager = {
//        let instance = SessionManager()
//        return instance
//    }()
//    
//    private init() {}
//        
//    func coordinateToAdres(adress: String, dataResponse: @escaping (GeoDecoder) -> Void) {
//        let urlString = "https://api.opencagedata.com/geocode/v1/json?q=\(adress)&key=6fdde9142f9648378e017befaec8f44c"
//        AF.request(urlString).responseJSON { response in
//            guard let data = (response.data) else { return }
//            let json = parseJSON(data: data)
//            switch response.result {
//            case .success:
//                if let json = json {
//                    DispatchQueue.main.async {
//                        dataResponse(json)
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    
//    func parseJSON(data: Data) -> GeoDecoder? {
//        do {
//            let main = try JSONDecoder().decode(GeoDecoder.self, from: data )
//            return main
//        } catch {
//            return nil
//        }
//    }
//}
