//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    var userDefaults = UserDefaults.standard
    var key = "access"
    private var menuImage = false
    let container = ContainerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapScrollView)))

    }

        @objc func didTapScrollView() {
            container.hideMenu()
        }
    
    @IBAction func profileTapped(_ sender: UIButton) {
        let profile = ProfileViewController.instantiate()
        profile.modalPresentationStyle = .fullScreen
        present(profile, animated: true)
    }
    
    @IBAction func enterTapped(_ sender: UIButton) {
        userDefaults.set(false, forKey: key)
        
    }
}
