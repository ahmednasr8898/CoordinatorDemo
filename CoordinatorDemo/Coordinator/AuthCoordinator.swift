//
//  AuthCoordinator.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

protocol AuthCoordinatorProtocol: AnyObject {
    func showLogin()
    func showRegister()
    func showResetPassword()
    func showUpdatePassword()
    func presentHome()
}

class AuthCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let presentHomeClosure: (()->())?
    
    init(presentHomeClosure: @escaping () -> Void) {
        navigationController = UINavigationController()
        self.presentHomeClosure = presentHomeClosure
    }
    
    func start() {
        showLogin()
    }
}

extension AuthCoordinator: AuthCoordinatorProtocol  {
    func showLogin() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        show(viewController: loginViewController)
    }
    
    func showRegister() {
        let registerViewController = RegisterViewController()
        registerViewController.coordinator = self
        show(viewController: registerViewController)
    }
    
    func showResetPassword() {
        let resetPasswordViewController = ResetPasswordViewController()
        resetPasswordViewController.coordinator = self
        show(viewController: resetPasswordViewController)
    }
    
    func showUpdatePassword() {
        let updatePasswordViewController = UpdatePasswordViewController()
        updatePasswordViewController.coordinator = self
        show(viewController: updatePasswordViewController)
    }
    
    func presentHome() {
        presentHomeClosure?()
    }
}
