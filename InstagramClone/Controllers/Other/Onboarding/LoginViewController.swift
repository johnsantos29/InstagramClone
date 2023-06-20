//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import SafariServices
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
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
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
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
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
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames for all the subviews
        
        headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height / 3
        )
        
        configureHeaderView()
        
        usernameEmailField.frame = CGRect(x: 25,
                                          y: headerView.bottom + 40,
                                          width: view.width - 50,
                                          height: 52)
        
        passwordField.frame = CGRect(x: 25,
                                     y: usernameEmailField.bottom + 10,
                                     width: view.width - 50,
                                     height: 52)
        
        loginButton.frame = CGRect(x: 25,
                                   y: passwordField.bottom + 10,
                                   width: view.width - 50,
                                   height: 52)
        
        createAccountButton.frame = CGRect(x: 25,
                                           y: loginButton.bottom + 10,
                                           width: view.width - 50,
                                           height: 52)
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: 10,
                                     y: view.height - view.safeAreaInsets.bottom - 50,
                                     width: view.width - 20,
                                     height: 50)
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let bgImageView = headerView.subviews.first else {
            return
        }
        
        bgImageView.frame = headerView.bounds
        
        // Add instagram logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width / 2,
                                 height: headerView.height - view.safeAreaInsets.top)
        
        headerView.addSubview(imageView)
    }
    
    @objc private func didTapLoginButton() {
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let username = usernameEmailField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8
        else {
            return
        }
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/155833707900388") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            didTapLoginButton()
        }
        
        return true
    }
}
