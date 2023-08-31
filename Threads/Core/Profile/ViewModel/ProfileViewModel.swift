//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 23/08/23.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        print("User service: \(String(describing: UserService.shared.currentUser?.email))")
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            if let user = user  {
                print("DEBUG: Current iser in Combine: \(user)")
            }
        }.store(in: &cancellables)
    }
}
