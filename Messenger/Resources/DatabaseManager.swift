//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Ravneet Singh on 22/04/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManger {
    static let shared = DatabaseManger()
    private let database = Database.database().reference()
     
    
}

// MARK: - Account Management

extension DatabaseManger {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)) {
        
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            print("Value is \(snapshot.value)")
            guard snapshot.value as? String != nil else {
                 return
            }
        }
        
    }
    
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String
}
