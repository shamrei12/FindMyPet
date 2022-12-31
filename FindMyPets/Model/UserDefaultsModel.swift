
import Foundation

protocol UserDefaultsProtocol {
    func load() -> [ProfileProtocol]
    func save(data: [ProfileProtocol])
}

class UserDefaultsModel: UserDefaultsProtocol {
    
    private var storage = UserDefaults.standard
    private var storageKey = "profile"
    
    private enum ContactKey: String {
    case name
    case number
    }
    
    func load() -> [ProfileProtocol] {
        var resultProfile: [ProfileProtocol] = []
        let storageProfile = storage.object(forKey: storageKey) as? [[String:String]] ?? []
        for profile in storageProfile {
            guard let name = profile[ContactKey.name.rawValue],
                  let number = profile[ContactKey.number.rawValue] else {
                    continue
            }
            resultProfile.append(Profile(name: name, number: number))
        }

        return resultProfile
    }

    
    func save(data: [ProfileProtocol]) {
        var arrayForStorage: [[String: String]] = []
        var newElementStorage: Dictionary<String,String> = [:]
        
        newElementStorage[ContactKey.name.rawValue] = data.first?.name
        newElementStorage[ContactKey.number.rawValue] = data.first?.number
        arrayForStorage.append(newElementStorage)
        
        storage.set(arrayForStorage, forKey: storageKey)
    }
    
    
}
