//
//  AuthService.swift
//  Threads
//
//  Created by Ricky Silitonga on 22/08/23.
//

import Firebase

class AuthService {
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            print("DEBUG: Succes to sign in the user with id: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to sign in the user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullName: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            print("DEBUG: Succes to create user with id: \(result.user.uid)")
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
    }
}
