//
//  Thread.swift
//  Threads
//
//  Created by Ricky Silitonga on 14/09/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
