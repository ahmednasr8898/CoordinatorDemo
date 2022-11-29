//
//  ResetPasswordViewController.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    weak var coordinator: AuthCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updatePasswordButtonWasTapped(_ sender: Any) {
        coordinator?.showUpdatePassword()
    }
    
}
