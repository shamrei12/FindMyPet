//
//  MessagesModel.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 4.01.23.
//

import Foundation

protocol Messages {
    var typeMessage: Int { get set }
    var textMessage: String { get set }
}

struct MessageUser: Messages {
    var typeMessage: Int
    var textMessage: String
}
