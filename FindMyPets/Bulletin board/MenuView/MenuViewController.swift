//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak private var enterUser: UIButton!
    @IBOutlet weak var registrationUser: UIButton!
    var userDefaults = UserDefaults.standard
    var key = "access"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func enterTapped(_ sender: UIButton) {
        userDefaults.set(true, forKey: key)
        let container = ContainerViewController()
        container.toogleMenu()
    }
}
