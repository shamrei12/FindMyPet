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
//    func countriesRequest(dataResponse: @escaping ([WelcomeElement]) -> Void) {
//        let urlString = "https://restcountries.com/v3.1/all"
//        request(urlString).responseJSON { [self] response in
//            guard let data = response.data else { return }
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
//    func countryRequest(common: String, dataResponse: @escaping ([WelcomeElement]) -> Void) {
//        let urlString = "https://restcountries.com/v3.1/alpha/\(common)"
//        request(urlString).responseJSON { [self] response in
//            guard let data = response.data else { return }
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
//    func parseJSON(data: Data) -> [WelcomeElement]? {
//        do {
//            let main = try JSONDecoder().decode([WelcomeElement].self, from: data)
//            return main
//        } catch {
//            return nil
//        }
//    }
//}
