//
//  ProfileViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 27.12.22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak private var saveTapped: UIBarButtonItem!
    @IBOutlet weak private var bulletinTupped: UIBarButtonItem!
    var userDefaults = UserDefaults.standard
    var key = "access"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backtapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
