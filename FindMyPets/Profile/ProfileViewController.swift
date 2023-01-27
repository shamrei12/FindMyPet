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
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    private var user: UserDefaultsModel!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imageProfile.layer.cornerRadius = 1000
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
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (
            info[UIImagePickerController.InfoKey.editedImage] as? UIImage ??
                       info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        )
        imageProfile.image = image
        dismiss(animated: true)
    }
    
}
