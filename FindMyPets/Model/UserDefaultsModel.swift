
import Foundation

protocol UserDefaultsProtocol {
    func load() -> [ProfileProtocol]
    func save(data: [ProfileProtocol])
}

class UserDefaultsModel: UserDefaultsProtocol {
    
    private var storage = UserDefaults.standard
    private var storageKey = "profile"
    private var settingKey = "setting"
    
    private enum ContactKey: String {
        case name
        case number
    }
    
    func load() -> [ProfileProtocol] {
        var resultProfile: [ProfileProtocol] = []
        let storageProfile = storage.object(forKey: storageKey) as? [[String:String]] ?? []
        guard let name = storageProfile.first?[ContactKey.name.rawValue],
              let number = storageProfile.first?[ContactKey.number.rawValue] else {
            return [Profile(name: "Аноним", number: "Введите номер телефона")]
            }
            resultProfile.append(Profile(name: name, number: number))
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
    
    func saveTheme(_ type: Bool) {
        storage.set(type, forKey: settingKey)
    }
    
    func showTheme() -> Bool {
        if storage.object(forKey: settingKey) == nil {
            return false
        } else {
            return storage.bool(forKey: settingKey)
        }
    }
}
