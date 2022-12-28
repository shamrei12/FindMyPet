//
//  ProfileViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 27.12.22.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak private var saveTapped: UIBarButtonItem!
    @IBOutlet weak private var bulletinTupped: UIBarButtonItem!
    private var choiceButton: Bool = false
    
    @IBOutlet weak var changeName: UIButton!
    @IBOutlet weak var changeNumber: UIButton!
    
    @IBOutlet weak private var nameLabel: UITextField!
    @IBOutlet weak var numberLabel: UITextField!
    
    var userDefaults = UserDefaults.standard
    private var nameKey: String = "name"
    private var numberKey: String = "number"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        nameLabel.borderStyle = .none
        numberLabel.borderStyle = .none
        nameLabel.isUserInteractionEnabled = false
        numberLabel.isUserInteractionEnabled = false
    }
    
    func updateUI() {
        let name = userDefaults.object(forKey: nameKey) as! String
        let number = userDefaults.object(forKey: numberKey) as? String
        print(name)
        nameLabel.placeholder = "\(name)"
        numberLabel.placeholder = "\(number!)"
        
    }
    @IBAction func changeName(_ sender: UIButton) {
        if changeName.titleLabel!.text! == "Изменить" {
            nameLabel.borderStyle = .roundedRect
            nameLabel.isUserInteractionEnabled = true
            changeName.setTitle("Сохранить", for: .normal)
        } else {
            if nameLabel.text!.count < 2 {
                nameLabel.placeholder = "Имя слишком короткое"
                nameLabel.text = ""
            } else {
                nameLabel.borderStyle = .none
                nameLabel.isUserInteractionEnabled = false
                nameLabel.placeholder = "\(nameLabel.text ?? "")"
                nameLabel.text = ""
                changeName.setTitle("Изменить", for: .normal)
            }

        }
    }
    
    @IBAction func changeNumber(_ sender: UIButton) {
        if changeNumber.titleLabel!.text! == "Изменить" {
            numberLabel.borderStyle = .roundedRect
            numberLabel.isUserInteractionEnabled = true
            changeNumber.setTitle("Сохранить", for: .normal)
        } else {
            numberLabel.borderStyle = .none
            numberLabel.isUserInteractionEnabled = false
            numberLabel.placeholder = "\(numberLabel.text!)"
            numberLabel.text = ""
            changeNumber.setTitle("Изменить", for: .normal)
        }
    }
    
    
    @IBAction func backtapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        numberLabel.placeholder = numberLabel.text
        userDefaults.set("\(nameLabel.placeholder!)", forKey: nameKey)
        userDefaults.set("\(numberLabel.placeholder!)", forKey: numberKey)
        dismiss(animated: true)
    }
}
