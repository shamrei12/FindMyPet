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
    func load() -> [LostPet]
    func save(data: [LostPet])
}


class Data: CoreDataProtocol {
    
    enum AdvertKey {
        case advertName
        case descriptionName
        case typePet
        case oldPet
        case lostAdress
    }
    
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
        taskObject.date = TimeManager.shared.currentDate() ?? ""
        taskObject.id = UUID()
        do {
            try context.save()
            print(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [LostPet] {
        var dataAdvert: [LostPet] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest: NSFetchRequest<Advert>
        fetchRequest = Advert.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        let objects = try! context.fetch(fetchRequest)
//        do {
//            try context.execute(NSBatchDeleteRequest(fetchRequest: NSFetchRequest(entityName: "Advert")))
//          try context.save()
//        } catch {
//        }
        for i in 0..<objects.count {
            guard let advertName = objects[i].advertName,
                  let descriptionName = objects[i].descriptionName,
                  let typePet = objects[i].typePet,
                  let oldPet = objects[i].oldPet,
                  let lostAdress = objects[i].lostAdress,
                  let date = objects[i].date,
                let id = objects[i].id  else {
                continue
            }
            dataAdvert.append(LostPets(postName: advertName, descriptionName: descriptionName, typePet: typePet, oldPet: oldPet, lostAdress: lostAdress, curentDate: date))
        }
        return dataAdvert
    }

}
