//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 22/08/23.
//

import Firebase

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            fullName: fullName,
            username: username
        )
    }
}
