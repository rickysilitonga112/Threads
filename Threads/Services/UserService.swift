//
//  UserService.swift
//  Threads
//
//  Created by Ricky Silitonga on 23/08/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    // current user log in
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchUsers() async throws -> [User] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("user").getDocuments()
        
        let users = snapshot.documents.compactMap { documentSnapshot in
            try? documentSnapshot.data(as: User.self)
        }
        return users.filter({$0.id != currentUid})
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("user").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: Current user log in is: \(currentUser!)")
    }
}
