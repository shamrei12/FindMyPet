import UIKit
import CoreData
import OpenCageSDK
import CoreLocation


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

class CreateAdvertViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak private var typePet: UIButton!
    @IBOutlet weak private var yoPet: UIButton!
    @IBOutlet weak private var countrySelect: UIButton!
    
    private var userDefaults = UserDefaults.standard
    private var key: String = "listAdvert"
    @IBOutlet weak private var advertName: UITextField!
    @IBOutlet weak var descriptionName: UITextView!
    private var isMove: Bool = false
    private var data: Data?
    var adress: String = ""
    @IBOutlet weak var showLocation: UISwitch!
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var houseNumber: UITextField!
    @IBOutlet weak var buildingNumber: UITextField!
    
    @IBOutlet weak var adressStack: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Data()
        descriptionName.textColor = .lightGray
        descriptionName.layer.borderColor = UIColor.lightGray.cgColor
        descriptionName.layer.borderWidth = 0.5
        descriptionName.delegate = self
        //        lostAdress.delegate = self
        choiceType()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        cityName.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        streetName.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        houseNumber.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        buildingNumber.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        
        //        locationManager = CLLocationManager()
        //        locationManager?.delegate = self
        //        locationManager?.requestAlwaysAuthorization()
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
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    func valdidAdvert() -> Bool {
        if advertName.text?.count ?? 0 > 10 && descriptionName.text.count > 10 && (yoPet.titleLabel?.text != "Возраст" && typePet.titleLabel?.text != "Тип питомца" && countrySelect.titleLabel?.text != "Страна" && cityName.text!.count > 3 && streetName.text!.count > 3 && houseNumber.text!.count > 1) {
            return true
        } else if advertName.text?.count ?? 0 > 10 && descriptionName.text.count > 10 && yoPet.titleLabel?.text != "Возраст" && typePet.titleLabel?.text != "Тип питомца" && showLocation.isOn {
            return true
        } else {
            return false
        }
    }
    
    
    
    @IBAction func showGeolocation(_ sender: UISwitch) {
        if sender.isOn {
            adressStack.isHidden = true
            let ocSDK :OCSDK = OCSDK(apiKey: "6fdde9142f9648378e017befaec8f44c")
            ocSDK.reverseGeocode(latitude: NSNumber(value: locationManager?.location?.coordinate.latitude ?? 0.0), longitude: NSNumber(value: locationManager?.location?.coordinate.longitude ?? 0.0), withAnnotations: true) { (response, success, error) in
                if success {
                    self.adress = response.locations.first?.formattedAddress ?? ""
                }
            }
        } else {
            adressStack.isHidden = false
        }
    }
    
    
    @IBAction func createAdvert(_ sender: UIBarButtonItem) {
        var advert: [LostPet] = []
        if valdidAdvert() {
            if showLocation.isOn {
                advert.append(LostPets(postName: advertName.text ?? "", descriptionName: descriptionName.text ?? "", typePet: typePet.titleLabel?.text ?? "", oldPet: yoPet.titleLabel?.text ?? "", lostAdress: adress , curentDate: TimeManager.shared.currentDate()))
            } else {
                let adressString = "\(countrySelect.titleLabel?.text), \(cityName.text ?? ""), \(streetName.text ?? ""), \(houseNumber.text ?? ""), \(buildingNumber.text ?? "")"
                advert.append(LostPets(postName: typePet.titleLabel?.text ?? "", descriptionName: yoPet.titleLabel?.text ?? "", typePet: adressString, oldPet: advertName.text ?? "", lostAdress: descriptionName.text ?? "", curentDate: TimeManager.shared.currentDate()))
            }
            data?.save(data: advert)
            dismiss(animated: true)
        }
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
            UIAction(title: "Возраст питомца", state: .on, handler: optionClousure),
            UIAction(title: "До 1 года", handler: optionClousure),
            UIAction(title: "От 1 до 3 лет", handler: optionClousure),
            UIAction(title: "От 3 лет", handler: optionClousure)
        ])
        
        countrySelect.menu = UIMenu(children: [
            UIAction(title: "Страна", state: .on, handler: optionClousure),
            UIAction(title: "Беларусь", handler: optionClousure)
        ])
        
        typePet.showsMenuAsPrimaryAction = true
        typePet.changesSelectionAsPrimaryAction = true
        
        yoPet.showsMenuAsPrimaryAction = true
        yoPet.changesSelectionAsPrimaryAction = true
        
        countrySelect.showsMenuAsPrimaryAction = true
        countrySelect.changesSelectionAsPrimaryAction = true
    }
}
