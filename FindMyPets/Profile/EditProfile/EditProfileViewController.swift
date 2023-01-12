//
//  EditProfileViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 10.01.23.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    
    @IBOutlet weak private var userName: UITextField!
    @IBOutlet weak private var userSurname: UITextField!
    @IBOutlet weak var userNumber: UITextField!
    var userInfo: [ProfileProtocol]?
    private var storage: UserDefaultsModel?
    private let profile = ProfileViewController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage = UserDefaultsModel()
        userInfo = storage!.load()
        updatePlaceholder()
        // Do any additional setup after loading the view.
    }
    
    func updatePlaceholder() {
        userName.placeholder = userInfo?.first?.name
        userSurname.placeholder = userInfo?.first?.surname
        userNumber.placeholder = userInfo?.first?.number
    }

    @IBAction func saveInfoTapped(_ sender: UIBarButtonItem) {
        var name: String = ""
        var surname: String = ""
        var number: String = ""
        if userName.text!.isEmpty {
            name = userInfo?.first?.name ?? ""
        } else {
            name = userName.text ?? ""
        }
        if userSurname.text!.isEmpty {
            surname = userInfo?.first?.surname ?? ""
        } else {
            surname = userSurname.text ?? ""
        }
        if userNumber.text!.isEmpty {
            number = userInfo?.first?.number ?? ""
        } else {
            number = userNumber.text ?? ""
        }
        
        storage?.save(data: [Profile(name: name, surname: surname, number: number)])
        profile.viewWillAppear(true)
        dismiss(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
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
