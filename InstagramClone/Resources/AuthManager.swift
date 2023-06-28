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

    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        // Check if username is available
        // Check if email is available
        DatabaseManager.shared.canCreateUser(with: email, username: username) { canCreate in
            if canCreate {
                // Create account
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard result != nil, error == nil else {
                        // there was an error in creating the account
                        completion(false)
                        return
                    }

                    // Insert account to DB
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { isNewUserInstertedToDb in
                        if isNewUserInstertedToDb {
                            completion(true)
                            return
                        } else {
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // Could not create account - either Email or Username exists
                completion(false)
            }
        }
    }

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

    public func logOut(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error.localizedDescription)
            completion(false)
            return
        }
    }
}
