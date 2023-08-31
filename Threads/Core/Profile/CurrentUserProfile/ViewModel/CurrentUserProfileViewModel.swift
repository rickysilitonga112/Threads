//
//  CurrentUserProfileViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 27/08/23.
//

import SwiftUI
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?

    private var cancellables = Set<AnyCancellable>()

    init() {
       setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                self?.currentUser = user
                
                // DEBUG
                // print("DEBUG: Current iser in Combine: \(user)")
            }
            .store(in: &cancellables)
    }
}
