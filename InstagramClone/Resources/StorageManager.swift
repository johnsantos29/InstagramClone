//
//  StorageManager.swift
//  InstagramClone
//
//  Created by John Erick Santos on 19/6/2023.
//

import FirebaseStorage

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType: UserPostType
}

public final class StorageManager {
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }

    static let shared = StorageManager()

    private let bucket = Storage.storage().reference()

    // MARK: - Public

    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {}

    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL { url, error in
            guard error == nil, let url = url else {
                completion(.failure(IGStorageManagerError.failedToDownload))

                return
            }

            completion(.success(url))
        }
    }
}
