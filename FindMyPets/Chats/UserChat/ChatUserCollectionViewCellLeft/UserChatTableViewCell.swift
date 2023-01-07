//
//  UserChatTableViewCell.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 3.01.23.
//

import UIKit

class UserChatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var message: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
