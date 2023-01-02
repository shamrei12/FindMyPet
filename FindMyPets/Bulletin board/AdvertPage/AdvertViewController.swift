//
//  AdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 19.12.22.
//

import UIKit
import CoreData

class AdvertViewController: UIViewController {
    
    @IBOutlet weak private var advertName: UILabel!
    @IBOutlet weak private var descriptoinName: UILabel!
    @IBOutlet weak private var oldPet: UILabel!
    @IBOutlet weak private var typePet: UILabel!
    @IBOutlet weak private var lostAdress: UILabel!
    @IBOutlet weak private var curentDate: UILabel!
    @IBOutlet weak private var numberAdvert: UILabel!
    private var user: UserDefaultsModel?
    
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        user = UserDefaultsModel()
        
    }
    
    func updateUI(_ index: Int) {
        let name = user?.load().first?.name ?? ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest: NSFetchRequest<Advert>
        fetchRequest = Advert.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        let objects = try! context.fetch(fetchRequest)
        advertName.text = objects[index].advertName
        descriptoinName.text = objects[index].descriptionName
        typePet.text = "Тип питомца: \(objects[index].typePet ?? "")"
        oldPet.text = "Возраст питомца: \(objects[index].oldPet ?? "")"
        lostAdress.text = "Адрес пропажи: \(objects[index].lostAdress ?? "" )"
        curentDate.text = objects[index].date
        username.text = name
        numberAdvert.text = "№ \(index + 1)"
    }
    

    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


