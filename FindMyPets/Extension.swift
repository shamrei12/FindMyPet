//
//  Extension.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 18.12.22.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let nibName = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil)[0] as! Self
    }
}
