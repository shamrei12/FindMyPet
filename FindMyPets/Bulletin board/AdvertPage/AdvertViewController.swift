//
//  AdvertViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 19.12.22.
//

import UIKit
import CoreData
import MapKit
import OpenCageSDK
class AdvertViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak private var advertName: UILabel!
    @IBOutlet weak private var descriptoinName: UILabel!
    @IBOutlet weak private var oldPet: UILabel!
    @IBOutlet weak private var typePet: UILabel!
    @IBOutlet weak private var lostAdress: UILabel!
    @IBOutlet weak private var curentDate: UILabel!
    @IBOutlet weak private var numberAdvert: UILabel!
    private var user: UserDefaultsModel?
    @IBOutlet weak var mapView: MKMapView!
    let annotations = MKPointAnnotation()
    
    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = UserDefaultsModel()
        mapView.layer.borderColor = UIColor.black.cgColor
        mapView.layer.borderWidth = 1
        //        getCoodrd(adress: "Беларусь, Лида, ул. Мицкевича, 38 к1")
    }
    
    func getCoodrd(adress: String) {
        let ocSDK :OCSDK = OCSDK(apiKey: "6fdde9142f9648378e017befaec8f44c")
        ocSDK.forwardGeocode(address: adress, withAnnotations: true) { [self] (response, success, error) in
            let latitude = Double(truncating: response.locations.first?.latitude ?? 0)
            let longitude = Double(truncating: response.locations.first?.longitude ?? 0)
            print(latitude)
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.addAnnotation(annotations)
            
            let cameraCenterd = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: cameraCenterd, latitudinalMeters: 3, longitudinalMeters: 3)
            mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
            //            self.mapView.setRegion(region, animated: false)
            
            let zoomRage = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1300)
            mapView.setCameraZoomRange(zoomRage, animated: false)
            mapView.isZoomEnabled = true
        }
    }
    
    
    func updateUI(_ index: Int) {
        let name = user?.load().first?.name ?? ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest: NSFetchRequest<Advert>
        fetchRequest = Advert.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        let objects = try! context.fetch(fetchRequest)
        advertName.text = objects[index].advertName
        descriptoinName.text = objects[index].descriptionName
        typePet.text = "Тип питомца: \(objects[index].typePet ?? "")"
        oldPet.text = "Возраст питомца: \(objects[index].oldPet ?? "")"
        lostAdress.text = "Адрес пропажи: \(objects[index].lostAdress ?? "" )"
        curentDate.text = objects[index].date
        username.text = name
        numberAdvert.text = "№ \(index + 1)"
        getCoodrd(adress: objects[index].lostAdress ?? "")
    }
    
    
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


