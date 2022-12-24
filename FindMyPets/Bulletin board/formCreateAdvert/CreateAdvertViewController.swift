//
//  CreateAdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 24.12.22.
//

import UIKit
import CoreData


class CreateAdvertViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak private var typePet: UIButton!
    @IBOutlet weak private var yoPet: UIButton!
    private var userDefaults = UserDefaults.standard
    private var key: String = "listAdvert"
    @IBOutlet weak private var advertName: UITextField!
    @IBOutlet weak private var descriptionName: UITextView!
    @IBOutlet weak var lostAdress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionName.textColor = UIColor.lightGray
        descriptionName.layer.borderColor = UIColor.lightGray.cgColor
        descriptionName.layer.borderWidth = 0.5
        descriptionName.delegate = self
        choiceType()
        
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        print(typePet.titleLabel?.text!)
        dismiss(animated: true)
    }
    
    @IBAction func createAdvert(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.newBackgroundContext()
//                do {
//                    try context.execute(NSBatchDeleteRequest(fetchRequest: NSFetchRequest(entityName: "Advert")))
//                    try context.save()
//                } catch let err {
//                    print(err)
//                }
        let entity = NSEntityDescription.entity(forEntityName: "Advert", in: context)
        guard let entity = entity else {
            return
        }
        let taskObject = NSManagedObject(entity: entity, insertInto: context) as! Advert
        
        taskObject.advertName = advertName.text ?? ""
        taskObject.descriptionName = descriptionName.text ?? ""
        taskObject.typePet = typePet.titleLabel?.text ?? ""
        taskObject.oldPet = yoPet.titleLabel?.text ?? ""
        taskObject.lostAdress = lostAdress.text ?? ""
        do {
            try context.save()
            print(true)
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true)
    }
    
    func choiceType() {
        let optionClousure = {(action: UIAction) in
            print(action.title)
        }
        
        typePet.menu = UIMenu(children: [
            UIAction(title: "Тип питомца", state: .on, handler: optionClousure),
            UIAction(title: "Собака", handler: optionClousure),
            UIAction(title: "Кот/Кошка", handler: optionClousure)
            
        ])
        
        yoPet.menu = UIMenu(children: [
            UIAction(title: "Возраст", state: .on, handler: optionClousure),
            UIAction(title: "До 1 года", handler: optionClousure),
            UIAction(title: "От 1 до 3 лет", handler: optionClousure),
            UIAction(title: "От 3 лет", handler: optionClousure),
        ])
        
        typePet.showsMenuAsPrimaryAction = true
        typePet.changesSelectionAsPrimaryAction = true
        
        yoPet.showsMenuAsPrimaryAction = true
        yoPet.changesSelectionAsPrimaryAction = true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionName.textColor == .lightGray {
            descriptionName.text = ""
            descriptionName.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionName.text.isEmpty {
            descriptionName.text = "Введите подробное описание"
            descriptionName.textColor = UIColor.lightGray
        }
    }
    
    
}
