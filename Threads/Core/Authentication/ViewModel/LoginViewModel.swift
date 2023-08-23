//
//  LoginViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 23/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            email: email,
            password: password
        )
    }
}
