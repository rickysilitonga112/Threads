//
//  AuthService.swift
//  Threads
//
//  Created by Ricky Silitonga on 22/08/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        if let userSession = self.userSession {
            print("DEBUG: Current user session id: \(userSession.uid)")
        }
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to sign in the user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullName: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            try await uploadUserData(email: email, password: password, fullName: fullName, userName: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        // sign out from firebase
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error while sign out with error: \(error.localizedDescription)")
        }
        // make sure the session is nil locally
        self.userSession = nil
        
        // make userSession in ProfileView is nil
        UserService.shared.currentUser = nil
        
    }
    
    @MainActor
    private func uploadUserData(email: String, password: String, fullName: String, userName: String, id: String) async throws {
        let user = User(id: id, email: email, fullName: fullName, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        
        try await Firestore.firestore().collection("user").document(id).setData(userData)
        
        UserService.shared.currentUser = user
    }
}
