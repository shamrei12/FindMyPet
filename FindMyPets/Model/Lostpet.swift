//
//  Lost pet.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 24.12.22.
//

import Foundation
import UIKit

protocol LostPet {
    var postName: String { get set }
    var descriptionName: String { get set }
    var typePet: String { get set }
    var oldPet: String { get set }
    var lostAdress: String { get set }
}

struct LostPets: LostPet {
    var typePet: String
    var oldPet: String
    var lostAdress: String
    var postName: String
    var descriptionName: String
}
