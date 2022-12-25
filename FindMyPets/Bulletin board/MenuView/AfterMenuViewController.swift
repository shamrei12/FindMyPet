//
//  AfterMenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 25.12.22.
//

import UIKit

protocol ExitUser {
    func exitUserTapped()
}
class AfterMenuViewController: UIViewController {
    var delegateExit: ExitUser?
    @IBOutlet weak var exitTapped: UIButton!
    var userDefaults = UserDefaults.standard
    var key = "access"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func exitTappedUser(_ sender: UIButton) {
        userDefaults.set(nil, forKey: key)
        let container = ContainerViewController()
        delegateExit?.exitUserTapped()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
