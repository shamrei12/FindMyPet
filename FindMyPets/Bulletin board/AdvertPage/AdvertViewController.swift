//
//  AdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 19.12.22.
//

import UIKit
import CoreData
import MapKit
import OpenCageSDK
class AdvertViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak private var advertName: UILabel!
    @IBOutlet weak private var descriptoinName: UILabel!
    @IBOutlet weak private var oldPet: UILabel!
    @IBOutlet weak private var typePet: UILabel!
    @IBOutlet weak private var lostAdress: UILabel!
    @IBOutlet weak private var curentDate: UILabel!
    @IBOutlet weak private var numberAdvert: UILabel!
    private var user: UserDefaultsModel?
    var adress: String!
    
    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = UserDefaultsModel()
        //        getCoodrd(adress: "Беларусь, Лида, ул. Мицкевича, 38 к1")
    }
    
//    func getCoodrd(adress: String) {
//
//    }
    
    
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
        adress = objects[index].lostAdress ?? ""
//        getCoodrd(adress: objects[index].lostAdress ?? "")
    }
    
    
    
    @IBAction func showMapTapped(_ sender: UIButton) {
        let mapVC = MapViewController.instantiate()
        mapVC.modalPresentationStyle = .formSheet
        mapVC.showMap(adress: adress)
        present(mapVC, animated: true)
    }
    
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


