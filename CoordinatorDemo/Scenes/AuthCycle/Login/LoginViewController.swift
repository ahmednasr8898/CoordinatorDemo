//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

class LoginViewController: UIViewController {

    weak var coordinator: AuthCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        print("login removed")
    }
    @IBAction func homeButtonWasTapped(_ sender: Any) {
        coordinator?.presentHome()
    }
    
    @IBAction func registerButtonWasTapped(_ sender: Any) {
        coordinator?.showRegister()
    }
    
    @IBAction func resetPasswordButtonWasTapped(_ sender: Any) {
        coordinator?.showResetPassword()
    }
    
}
