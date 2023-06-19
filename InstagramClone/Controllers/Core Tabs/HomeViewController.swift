//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import FirebaseAuth
import UIKit

final class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        handleNotAuthenticated()
    }

    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show login
            let loginVC = LoginViewController()

            // full screen for the user to not be able to close the modal
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}
