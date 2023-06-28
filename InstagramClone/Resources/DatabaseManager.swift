//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by John Erick Santos on 19/6/2023.
//

import FirebaseDatabase

public final class DatabaseManager {
    static let shared = DatabaseManager()

    private let database = Database.database().reference()

    /// Check if username and email is available
    /// - Parameters:
    ///   - email: String representing email
    ///   - username: String representing username
    public func canCreateUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        // TODO: implement validation
        completion(true)
    }

    /// Inserts new user to the realtime db
    /// - Parameters:
    ///   - email: String representing email
    ///   - username: String representing username
    ///   - completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                completion(false)
                return
            }
        }
    }
}
