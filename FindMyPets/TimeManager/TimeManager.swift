//
//  TimeManager.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 1.01.23.
//

import Foundation


class TimeManager {
    
    static var shared: TimeManager = {
        let instance = TimeManager()
        return instance
    }()
    
    
    func currentDate() -> String{
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormater.locale = Locale.current
        dateFormater.dateFormat = "dd.MM.yyyy"
        let formattedString = dateFormater.string(from: date)
        return formattedString
    }
}

