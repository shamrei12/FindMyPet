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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func updateUI() {
        let profile = user?.load()
        userName?.text = "\(profile?.first?.name ?? "") \(profile?.first?.surname ?? "")"
    }
    
    @IBAction func iditProfileTapped(_ sender: UIButton) {
        let iditProfile = EditProfileViewController.instantiate()
        iditProfile.modalPresentationStyle = .formSheet
        present(iditProfile, animated: true)
        
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
