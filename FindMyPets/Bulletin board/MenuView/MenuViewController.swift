//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

class MenuViewController: UIViewController {

    var userDefaults = UserDefaults.standard
    var key = "access"
    let container = BulletinViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func profileTapped(_ sender: UIButton) {
        container.didTapScrollView()
        let profile = ProfileViewController.instantiate()
        profile.modalPresentationStyle = .fullScreen
        present(profile, animated: true)
    }
    
    @IBAction func enterTapped(_ sender: UIButton) {
        userDefaults.set(false, forKey: key)
        
    }
}
