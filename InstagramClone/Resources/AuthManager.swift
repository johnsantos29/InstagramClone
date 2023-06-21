//
//  AuthManager.swift
//  InstagramClone
//
//  Created by John Erick Santos on 19/6/2023.
//

import FirebaseAuth

public final class AuthManager {
    static let shared = AuthManager()

    // MARK: - Public

    public func registerNewUser(username: String, email: String, password: String) {}

    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }

                completion(true)
            }
        } else if let username = username {
            // username login
        }
    }
}
