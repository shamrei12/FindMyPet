//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

class MenuViewController: UIViewController{


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func createTapped(_ sender: UIButton) {
        let bulletinVC = ContainerViewController()
        bulletinVC.showBulletinViewController(shouldMove: false)
    }

}
