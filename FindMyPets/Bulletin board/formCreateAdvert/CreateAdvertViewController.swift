//
//  CreateAdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 24.12.22.
//
import UIKit
import CoreData


extension CreateAdvertViewController: UITextViewDelegate {
    

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Описание"
            textView.textColor = UIColor.lightGray
        }
    }
}

class CreateAdvertViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak private var typePet: UIButton!
    @IBOutlet weak private var yoPet: UIButton!
    private var userDefaults = UserDefaults.standard
    private var key: String = "listAdvert"
    @IBOutlet weak private var advertName: UITextField!
    @IBOutlet weak var descriptionName: UITextView!
    @IBOutlet weak var lostAdress: UITextField!
    private var isMove: Bool = false
    private var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Data()
        descriptionName.textColor = .lightGray
        descriptionName.layer.borderColor = UIColor.lightGray.cgColor
        descriptionName.layer.borderWidth = 0.5
        descriptionName.delegate = self
        lostAdress.delegate = self
        choiceType()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        lostAdress.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
    }
    
    @objc func editingBegan(_ textField: UITextField) {
        isMove = true
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if isMove {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }

    }

    @objc func keyboardWillHide(notification: NSNotification) {
        isMove = false
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func createAdvert(_ sender: UIButton) {
        var advert: [LostPet] = []
        advert.append(LostPets(typePet: typePet.titleLabel?.text ?? "", oldPet: yoPet.titleLabel?.text ?? "", lostAdress: lostAdress.text ?? "", postName: advertName.text ?? "", descriptionName: descriptionName.text ?? ""))
        data?.save(data: advert)
        dismiss(animated: true)
    }
    
    func choiceType() {
        let optionClousure = {(action: UIAction) in
            print(action.title)
        }
        
        typePet.menu = UIMenu(children: [
            UIAction(title: "Тип питомца", state: .on, handler: optionClousure),
            UIAction(title: "Собака", handler: optionClousure),
            UIAction(title: "Кот/Кошка", handler: optionClousure)
            
        ])
        
        yoPet.menu = UIMenu(children: [
            UIAction(title: "Возраст", state: .on, handler: optionClousure),
            UIAction(title: "До 1 года", handler: optionClousure),
            UIAction(title: "От 1 до 3 лет", handler: optionClousure),
            UIAction(title: "От 3 лет", handler: optionClousure),
        ])
        
        typePet.showsMenuAsPrimaryAction = true
        typePet.changesSelectionAsPrimaryAction = true
        
        yoPet.showsMenuAsPrimaryAction = true
        yoPet.changesSelectionAsPrimaryAction = true
    }
}

