//
//  ContainerViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

protocol ToogleMenuDelegate {
    func hide()
    func visible()
}

class ContainerViewController: UIViewController, BulletinViewControllerDeleagete {

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
        if menuViewController == nil {
            menuViewController = MenuViewController.instantiate()
            view.insertSubview(menuViewController.view, at: 1)
            addChild(menuViewController)
            menuViewController.view.frame.size.width = 0
        }
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
                self.menuViewController.view.frame.size.width = 200
                self.menuViewController.viewWillAppear(true)
                
            })
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.menuViewController.viewWillDisappear(true)
                self.menuViewController.view.frame.size.width = 0
            })
        }
    }
    
    //MARK: Menu
    func showMenu() {
        configureMenuViewController()
        showBulletinViewController(shouldMove: true)
    }
    
    func hideMenu() {
        configureMenuViewController()
        showBulletinViewController(shouldMove: false)
    }
    

    
}
