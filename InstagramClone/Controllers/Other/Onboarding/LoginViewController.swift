//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import UIKit

final class LoginViewController: UIViewController {
    enum Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
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
        let bgImageView = UIImageView(image: UIImage(named: "gradient"))
        
        let uiHeaderView = UIView()
        uiHeaderView.clipsToBounds = true
        uiHeaderView.addSubview(bgImageView)
        
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
            height: view.height / 3
        )
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard var bgImageView = headerView.subviews.first else {
            return
        }
        
        bgImageView.frame = headerView.bounds
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapCreateAccountButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
}
