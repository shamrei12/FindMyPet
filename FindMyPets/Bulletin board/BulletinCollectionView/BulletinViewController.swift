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
        let advertVC = AdvertViewController.instantiate()
        advertVC.modalPresentationStyle = .fullScreen
        advertVC.updateUI(indexPath.row)
        present(advertVC, animated: true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listAdvert = []
        addPets()
    }
    
    func addPets() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest: NSFetchRequest<Advert>
        fetchRequest = Advert.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        let objects = try! context.fetch(fetchRequest)
//        do {
//            try context.execute(NSBatchDeleteRequest(fetchRequest: NSFetchRequest(entityName: "Advert")))
//            try context.save()
//        } catch let err {
//            print(err)
//        }
//
            for advert in 0..<objects.count {
                listAdvert.append(LostPets(typePet: objects[advert].typePet ?? "", oldPet: objects[advert].oldPet ?? "", lostAdress: objects[advert].lostAdress ?? "", postName: objects[advert].advertName ?? "", descriptionName: objects[advert].descriptionName ?? ""))
            }
        collectionView.reloadData()
        
    }
    
    
    
    @IBAction func createAdvert(_ sender: UIBarButtonItem) {
        let countryVC = CreateAdvertViewController.instantiate()
        countryVC.modalPresentationStyle = .fullScreen
        present(countryVC, animated: true)
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }
}

