//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import UIKit

final class LoginViewController: UIViewController {
    private let usernameEmailField: UITextField = .init()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let headerView: UIView = {
        let uiHeaderView = UIView()
        
        return uiHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubviews(
            usernameEmailField,
            passwordField,
            loginButton,
            createAccountButton,
            termsButton,
            privacyButton,
            headerView
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames for all the subviews
        
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: 200
        )
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapCreateAccountButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
}
