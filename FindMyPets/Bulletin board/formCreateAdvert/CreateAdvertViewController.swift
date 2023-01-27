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

extension CreateAdvertViewController: CLLocationManagerDelegate {
    @IBAction func showGeolocation(_ sender: UISwitch) {
        if sender.isOn {
            geodecoder?.coordinatesToAdress(coordinates: (locationManager.location?.coordinate.latitude ?? 0.0, locationManager.location?.coordinate.longitude ?? 0.0)) { response in
                self.adress = response
            }
        } else {
            spinner.isHidden = true
            adressStack.isHidden = false
        }
    }
}

class CreateAdvertViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak private var typePet: UIButton!
    @IBOutlet weak private var yoPet: UIButton!
    @IBOutlet weak private var countrySelect: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    private var userDefaults = UserDefaults.standard
    private var key: String = "listAdvert"
    @IBOutlet weak private var advertName: UITextField!
    @IBOutlet weak var descriptionName: UITextView!
    private var isMove: Bool = false
    private var data: Data?
    @IBOutlet weak var showLocation: UISwitch!
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var streetName: UITextField!
    @IBOutlet weak var houseNumber: UITextField!
    @IBOutlet weak var buildingNumber: UITextField!
    @IBOutlet weak var adressStack: UIStackView!
    
    private var geodecoder: GeocoderModel?
    private var adressString: String = ""
    var adress: String? = nil
    var formatedAdres: String? = nil
//    var newAdress: String? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        data = Data()
        geodecoder = GeocoderModel()
        descriptionName.textColor = .lightGray
        descriptionName.layer.borderColor = UIColor.lightGray.cgColor
        descriptionName.layer.borderWidth = 0.5
        descriptionName.delegate = self
        choiceType()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        cityName.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        streetName.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        houseNumber.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        buildingNumber.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
        
                locationManager = CLLocationManager()
                locationManager?.delegate = self
                locationManager?.requestAlwaysAuthorization()
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
    
//    Срочно исправить валидацию формы. Сделать ее проще и лучше!!!!!!!!
    func valdidAdvert() -> Bool {
        if advertName.text?.count ?? 0 > 10 && descriptionName.text.count > 10 && yoPet.titleLabel?.text != "Возраст" && typePet.titleLabel?.text != "Тип питомца" && countrySelect.titleLabel?.text != "Страна" && cityName.text?.count ?? 0 > 3 && streetName.text!.count > 3 && houseNumber.text?.count ?? 0 > 1 {
            return true
        } else {
            return false
        }
    }
    
    func validLocationShow() -> Bool {
        if advertName.text?.count ?? 0 > 10 && descriptionName.text.count > 10 && yoPet.titleLabel?.text != "Возраст" && typePet.titleLabel?.text != "Тип питомца" && showLocation.isOn {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func createAdvert(_ sender: UIBarButtonItem) {
        createdAdvert()
        }
    
    func createdAdvert() {
        spinner.isHidden = false
        spinner.startAnimating()
            if showLocation.isOn {
                if validLocationShow() {
                    if adress == nil  {
                        createdAdvert()
                    } else {
                        saveData(adress: adress ?? "")
                    }
                }
            } else {
                if valdidAdvert() {
                    if buildingNumber.text?.count ?? 0 > 0 {
                        adressString = "\(countrySelect.titleLabel?.text ?? ""), \(cityName.text ?? ""), улица \(streetName.text ?? ""), \(houseNumber.text ?? "") к\(buildingNumber.text ?? "")"
                    } else {
                        adressString = "\(countrySelect.titleLabel?.text ?? ""), \(cityName.text ?? ""), улица \(streetName.text ?? ""), \(houseNumber.text ?? "")"
                    }
                    
                    makeAdress(adress: adressString) { [self] adressCurrent in
                        formatedAdres = adressCurrent
                        saveData(adress: formatedAdres ?? "")
                    }
                    
                   
//
//                    if formatedAdres == "" {
//                        createdAdvert()
//                    } else {
                        
//                    }
                }
            }

    }
    
    func saveData(adress: String) {
        var advert: [LostPet] = []

        advert.append(LostPets(postName: advertName.text ?? "", descriptionName: descriptionName.text ?? "", typePet: typePet.titleLabel?.text ?? "", oldPet: yoPet.titleLabel?.text ?? "", lostAdress: adress, curentDate: TimeManager.shared.currentDate()))
        
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.hidesWhenStopped = true
            self.dismiss(animated: true)
        }
        
        data?.save(data: advert)
        
    }

    func makeAdress(adress: String, complition: @escaping (String) -> Void) {
//        var latitudeCurent: Double = 0.0
//        var longtitudeCurent: Double = 0.0
//        var newAdress: String = ""
        
            self.geodecoder?.adressToСoordinates(adress: adress) { latitude, longtitude in

                self.geodecoder?.coordinatesToAdress(coordinates: (latitude, longtitude)) { adressCurrent in
                    complition(adressCurrent)
                }
            }
        



//        self.geodecoder?.adressFormated(adress: adress) { [self] response in
//                newAdress = response
//            print(response)
//        }
//        print(newAdress)
//        return newAdress ?? ""
    }

//
//    @objc func makeAdress() {
//        self.geodecoder?.adressFormated(adress: adressString) { response in
//            self.adressString = response
//            print(self.adressString)
//        }
//    }
    
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
