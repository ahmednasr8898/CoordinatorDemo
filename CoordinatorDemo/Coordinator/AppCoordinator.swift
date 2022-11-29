//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Semicolon on 29/11/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow
    private var children: [Coordinator] = []
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        //check if user logged
        //presentHomeCoordinator()
        //if user not logged
        //presentHomeCoordinator
        presentAuthCoordinator()
    }
}

extension AppCoordinator {
    private func presentAuthCoordinator() {
        let authCoordinator = AuthCoordinator { [weak self] in
            self?.children.removeAll()
            self?.presentHomeCoordinator()
        }
        startCoordinator(authCoordinator)
        replaceWindowRootViewController(authCoordinator.navigationController)
    }
    
    private func presentHomeCoordinator() {
        let homeCoordinator = HomeCoordinator { [weak self] in
            self?.children.removeAll()
            self?.presentAuthCoordinator()
        }
        startCoordinator(homeCoordinator)
        replaceWindowRootViewController(homeCoordinator.navigationController)
    }
}


//MARK: start coordinator
//
private extension AppCoordinator {
    private func startCoordinator(_ coordinator: Coordinator) {
        children = [coordinator]
        coordinator.start()
    }
}

// MARK: replace root view controller Window
//
private extension AppCoordinator {
    func replaceWindowRootViewController(_ viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.window.rootViewController = viewController
            self.window.makeKeyAndVisible()
        }, completion: { _ in
            // maybe do something on completion here
        })
    }
}
