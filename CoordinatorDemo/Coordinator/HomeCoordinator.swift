//
//  HomeCoordinator.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
    func showHome()
    func showSettings()
    func showProfile()
    func logOut()
}

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    private var logOutClosure: (()->())?
    
    init(logOutClosure: @escaping () -> Void) {
        navigationController = UINavigationController()
        self.logOutClosure = logOutClosure
    }
    
    func start() {
        showHome()
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showHome() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        show(viewController: homeViewController)
    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self
        show(viewController: settingsViewController)
    }
    
    func showProfile() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        show(viewController: profileViewController)
    }
    
    func logOut() {
        logOutClosure?()
    }
}

