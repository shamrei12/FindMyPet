//
//  ProfileModel.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 30.12.22.
//
import Foundation

protocol ProfileProtocol {
    var name: String { get set }
    var number: String { get set }
    var surname: String { get set }
}


struct Profile: ProfileProtocol {
    var name: String
    var surname: String
    var number: String
}
