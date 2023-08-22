//
//  ContentViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 22/08/23.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink {[weak self] userSession in
            self?.userSession = userSession
        }
    }
}
