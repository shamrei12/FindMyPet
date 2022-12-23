//
//  BulletinViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 18.12.22.
//

import UIKit

protocol  BulletinViewControllerDeleagete {
     func toogleMenu()
}

class BulletinViewController: UIViewController {
    var delegate: BulletinViewControllerDeleagete?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "BulletinCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BulletinCollectionViewCell")
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate?.toogleMenu()
    }
}

extension BulletinViewController: UICollectionViewDelegate {
    
}

extension BulletinViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let advetPage = AdvertViewController.instantiate()
        advetPage.modalPresentationStyle = .fullScreen
        present(advetPage, animated: true)
    }
    
}
    
    
