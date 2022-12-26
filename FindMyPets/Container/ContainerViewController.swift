//
//  ContainerViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit



class ContainerViewController: UIViewController, BulletinViewControllerDeleagete, ExitUser {
    func exitUserTapped() {
        toogleMenu()
    }
    
    var controller: UIViewController!
    var menuViewController: UIViewController!
    var isMove = false
    var userDefaults = UserDefaults.standard
    var key = "access"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBulletinViewController()
    }
    
    func configureBulletinViewController() {
        let bulletinVC = BulletinViewController.instantiate()
        bulletinVC.delegate = self
        controller = bulletinVC
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureMenuViewController() {
        if (userDefaults.object(forKey: key) as? Bool) as? Bool == true {
                menuViewController = MenuViewController.instantiate()
        } else {
            menuViewController = AfterMenuViewController.instantiate()
        }
        view.insertSubview(menuViewController.view, at: 0)
        addChild(menuViewController)
    }
        
        func showBulletinViewController(shouldMove: Bool ) {
            if shouldMove {
                // show
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0,
                               options: .curveEaseInOut,
                               animations: {
                    self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
                })
            } else {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0,
                               options: .curveEaseInOut,
                               animations: {
                    self.controller.view.frame.origin.x = 0
                })
            }
        }
        
        //MARK: Menu
        func toogleMenu() {
            configureMenuViewController()
            isMove = !isMove
            showBulletinViewController(shouldMove: isMove)
        }
    }
