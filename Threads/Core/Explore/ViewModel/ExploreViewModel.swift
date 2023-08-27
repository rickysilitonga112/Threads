//
//  ExploreViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 26/08/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.shared.fetchUsers()
    }
}
