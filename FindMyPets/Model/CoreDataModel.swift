//
//  CoreDataModel.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 31.12.22.
//

import Foundation
import CoreData
import UIKit



protocol CoreDataProtocol {
//    func save() -> [LostPets]
    func save(data: [LostPet])
}


class Data: CoreDataProtocol {
    func save(data: [LostPet]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.newBackgroundContext()
        let entity = NSEntityDescription.entity(forEntityName: "Advert", in: context)
        guard let entity = entity else {
            return
        }
        let taskObject = NSManagedObject(entity: entity, insertInto: context) as! Advert
        
        taskObject.advertName = data.first?.postName ?? ""
        taskObject.descriptionName = data.first?.descriptionName ?? ""
        taskObject.typePet = data.first?.typePet ?? ""
        taskObject.oldPet = data.first?.oldPet ?? ""
        taskObject.lostAdress = data.first?.lostAdress ?? ""
        do {
            try context.save()
            print(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
