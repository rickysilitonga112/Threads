//
//  CurrentUserProfileViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 27/08/23.
//

import Combine


class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
//        print("User service: \(UserService.shared.currentUser?.email)")
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
//            print("DEBUG: Current iser in Combine: \(user)")
        }.store(in: &cancellables)
    }
}
