//
//  BulletinViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 18.12.22.
//

import UIKit
import CoreData

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
        cell.advertName.text = listAdvert[indexPath.row].postName
        cell.informationText.text = listAdvert[indexPath.row].descriptionName
        cell.imagePet.image = UIImage(named: "petImage.jpeg")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if menuImage {
            menuTapped.image = UIImage(named: "menu_1.png")
            menuImage = false
        }
        if !visibleMenu {
            visibleMenu = true
            hideMenu()
        } else {
            let advertVC = AdvertViewController.instantiate()
            advertVC.modalPresentationStyle = .fullScreen
            advertVC.updateUI(indexPath.row)
            present(advertVC, animated: true)
        }
    }
}

protocol MenuViewControllerDelegate {
    func visible()
    func hide()
}


protocol  BulletinViewControllerDeleagete {
    func showMenu()
    func hideMenu()
}

class BulletinViewController: UIViewController {
    
    @IBOutlet weak var createAdvert: UIBarButtonItem!
    @IBOutlet weak private var bulletinView: UIView!
    @IBOutlet weak private var menuTapped: UIBarButtonItem!
    private var visibleMenu: Bool = true
    private var menuImage = false
    var delegate: BulletinViewControllerDeleagete?
    var menuDelegate: MenuViewControllerDelegate?
    private var listAdvert: [LostPet] = []
    private var userDefaults = UserDefaults.standard
    private var storageKey = "profile"
    @IBOutlet weak var collectionView: UICollectionView!
    private var user: Data?
    private var profile: UserDefaultsModel!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = Data()
        profile = UserDefaultsModel()
//        profile?.load()
        collectionView.register(UINib(nibName: "BulletinCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BulletinCollectionViewCell")
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        delegate?.showMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.hideMenu()
        listAdvert = []
        addPets()
        delegate?.hideMenu()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        delegate?.showMenu()
//        delegate?.hideMenu()
        delegate?.hideMenu()
    }
    
    func addPets() {
        let objects: [LostPets] = user?.load() as! [LostPets]
        for advert in 0..<objects.count {
            listAdvert.append(LostPets(postName: objects[advert].postName, descriptionName: objects[advert].descriptionName, typePet: objects[advert].typePet, oldPet: objects[advert].oldPet, lostAdress: objects[advert].lostAdress, curentDate: objects[advert].curentDate))
        }
        collectionView.reloadData()
    }
    
    @IBAction func createAdvert(_ sender: UIBarButtonItem) {
        let countryVC = CreateAdvertViewController.instantiate()
        countryVC.modalPresentationStyle = .fullScreen
        present(countryVC, animated: true)
    }
    
    func hideMenu() {
        delegate?.showMenu()
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        delegate?.hideMenu()
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        hideMenu()
    }
}

