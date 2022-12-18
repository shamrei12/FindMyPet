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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
