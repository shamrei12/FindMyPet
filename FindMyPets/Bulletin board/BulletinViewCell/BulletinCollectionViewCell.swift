//
//  BulletinCollectionViewCell.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 18.12.22.
//

import UIKit

class BulletinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePet: UIImageView!
    @IBOutlet weak var advertName: UILabel!
    @IBOutlet weak var informationText: UILabel!
    var cell: BulletinCollectionViewCell!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.makeShadow()
        imagePet.layer.cornerRadius = 10
    }
    
    
}
