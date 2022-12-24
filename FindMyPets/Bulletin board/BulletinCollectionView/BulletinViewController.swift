//
//  BulletinViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 18.12.22.
//

import UIKit

extension BulletinViewController: UICollectionViewDelegate {
    
}

extension BulletinViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listAdvert.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: BulletinCollectionViewCell
        if let reuseCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BulletinCollectionViewCell", for: indexPath) as? BulletinCollectionViewCell {
            cell = reuseCell
        } else {
            cell = BulletinCollectionViewCell()
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: BulletinCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        reloadList()
        cell.advertName.text = listAdvert[indexPath.row].postName
        cell.informationText.text = listAdvert[indexPath.row].descriptionName
        cell.imagePet.image = UIImage(named: "petImage.jpeg")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var CreateAdvertVC = CreateAdvertViewController.instantiate()
        CreateAdvertVC.modalPresentationStyle = .fullScreen
        present(CreateAdvertVC, animated: true)
    }
}




protocol  BulletinViewControllerDeleagete {
    func toogleMenu()
}

class BulletinViewController: UIViewController {
    var delegate: BulletinViewControllerDeleagete?
    private var listAdvert: [LostPet] = []
    var userDefaults = UserDefaults.standard
    var key: String = "listAdvert"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "BulletinCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BulletinCollectionViewCell")
    }
    
    func addPets() {
        userDefaults.set(listAdvert, forKey: key)
    }
    
    func reloadList() {
        listAdvert = userDefaults.object(forKey: key) as! [LostPet]
        collectionView.reloadData()
    }
    
    @IBAction func createAdvert(_ sender: UIBarButtonItem) {
        //        listAdvert.append(LostPets(typePet: "dog", oldPet: "1-3", lostAdress: "lida, Mistsckevicha streed, h. 38", postName: "Потерялась собака по кличке семен", descriptionName: "Потерялась собака по кличке семен. У нее красный ошейник и белое ухо. Вернем за вознагрождение"))
        let countryVC = CreateAdvertViewController.instantiate()
        countryVC.modalPresentationStyle = .fullScreen
        present(countryVC, animated: true)
        
        
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }
}

