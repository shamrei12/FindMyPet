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
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var changeName: UIButton!
    @IBOutlet weak var changeNumber: UIButton!
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak private var nameLabel: UITextField!
    @IBOutlet weak private var numberLabel: UITextField!
    private var user: UserDefaultsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = UserDefaultsModel()
        updateUI()
        
    }
    
    func updateUI() {
        let profile = user?.load()
        //        nameLabel.borderStyle = .none
        //        numberLabel.borderStyle = .none
        //        nameLabel.isUserInteractionEnabled = false
        //        numberLabel.isUserInteractionEnabled = false
        userName.text = "\(profile?.first?.name ?? "") \(profile?.first!.surname ?? "")"
        //        nameLabel.placeholder = profile?.first?.name
        //        numberLabel.placeholder = profile?.first?.number
        
        //        if user.showTheme() {
        //            navBar.tintColor = UIColor.white
        //            navBar.barTintColor = UIColor.black
        //            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //            nameLabel.attributedPlaceholder = NSAttributedString(
        //                string: profile?.first?.name ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        //            numberLabel.attributedPlaceholder = NSAttributedString(
        //                string: profile?.first?.number ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        //            changeName.tintColor = UIColor.white
        //            changeNumber.tintColor = UIColor.white
        //            mainView.layer.backgroundColor = UIColor.black.cgColor
        //            saveTapped.tintColor = UIColor.white
        //            bulletinTupped.tintColor = UIColor.white
        //
        //        } else {
        //            navBar.tintColor = UIColor.black
        //            navBar.barTintColor = UIColor.white
        //            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        //            changeName.tintColor = UIColor.black
        //            changeNumber.tintColor = UIColor.black
        //            mainView.layer.backgroundColor = UIColor.white.cgColor
        //            saveTapped.tintColor = UIColor.black
        //            bulletinTupped.tintColor = UIColor.black
        //            nameLabel.attributedPlaceholder = NSAttributedString(
        //                string: profile?.first?.name ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        //            numberLabel.attributedPlaceholder = NSAttributedString(
        //                string: profile?.first?.number ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        //        }
    }
    
    @IBAction func iditProfileTapped(_ sender: UIButton) {
        let iditProfile = EditProfileViewController.instantiate()
        iditProfile.modalPresentationStyle = .formSheet
        present(iditProfile, animated: true)
        
    }
    
    
    
    @IBAction func changeName(_ sender: UIButton) {
        //        if changeName.titleLabel!.text! == "Изменить" {
        //            nameLabel.borderStyle = .roundedRect
        //            nameLabel.isUserInteractionEnabled = true
        //            changeName.setTitle("Сохранить", for: .normal)
        //        } else {
        //            if nameLabel.text!.count < 2 {
        //                nameLabel.placeholder = "Имя слишком короткое"
        //                nameLabel.text = ""
        //            } else {
        //                nameLabel.borderStyle = .none
        //                nameLabel.isUserInteractionEnabled = false
        //                nameLabel.placeholder = "\(nameLabel.text ?? "")"
        //                nameLabel.text = ""
        //                changeName.setTitle("Изменить", for: .normal)
        //            }
        //        }
    }
    
    @IBAction func changeNumber(_ sender: UIButton) {
        //        if changeNumber.titleLabel!.text! == "Изменить" {
        //            numberLabel.borderStyle = .roundedRect
        //            numberLabel.isUserInteractionEnabled = true
        //            changeNumber.setTitle("Сохранить", for: .normal)
        //        } else {
        //            if numberLabel.text != "" {
        //                numberLabel.borderStyle = .none
        //                numberLabel.isUserInteractionEnabled = false
        //                numberLabel.placeholder = "\(numberLabel.text ?? "")"
        //                numberLabel.text = ""
        //                changeNumber.setTitle("Изменить", for: .normal)
        //            }
        //        }
    }
    
    
    @IBAction func backtapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        //        let number: String = numberLabel.placeholder!
        //        let name: String = nameLabel.placeholder!
        //        var profiele: [ProfileProtocol] = []
        //        profiele.append(Profile(name: name, surname: "Анонимный", number: number))
        //        user?.save(data: profiele)
        //        dismiss(animated: true)
        //    }
    }
}
