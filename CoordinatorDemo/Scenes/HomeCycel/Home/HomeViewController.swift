//
//  HomeViewController.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    weak var coordinator: HomeCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        print("home removed")
    }
    
    @IBAction func settingsButtonWasTapped(_ sender: Any) {
        coordinator?.showSettings()
    }
    
    @IBAction func profileButtonWasTapped(_ sender: Any) {
        coordinator?.showProfile()
    }
    
    @IBAction func logOutButtonWasTapped(_ sender: Any) {
        coordinator?.logOut()
    }
}
