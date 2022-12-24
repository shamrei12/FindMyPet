//
//  CreateAdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 24.12.22.
//

import UIKit

class CreateAdvertViewController: UIViewController {

    @IBOutlet weak var typePet: UIButton!
    @IBOutlet weak var yoPet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceType()
        
    }

    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func createAdvert(_ sender: UIButton) {

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
    
    
    
}
