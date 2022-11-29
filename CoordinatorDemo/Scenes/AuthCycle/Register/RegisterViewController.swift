//
//  RegisterViewController.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    
    weak var coordinator: AuthCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func homeButtonWasTapped(_ sender: Any) {
        coordinator?.presentHome()
    }
}
