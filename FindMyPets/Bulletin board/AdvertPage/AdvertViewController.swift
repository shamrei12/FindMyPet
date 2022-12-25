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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(_ index: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest: NSFetchRequest<Advert>
        fetchRequest = Advert.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        let objects = try! context.fetch(fetchRequest)
        advertName.text = objects[index].advertName
        descriptoinName.text = objects[index].descriptionName
        typePet.text = objects[index].typePet
        oldPet.text = objects[index].oldPet
        lostAdress.text = objects[index].lostAdress
    }
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

}
