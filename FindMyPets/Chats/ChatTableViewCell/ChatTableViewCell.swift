//
//  ChatTableViewCell.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 3.01.23.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageUser.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
