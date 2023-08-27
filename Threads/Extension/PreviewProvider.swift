//
//  PreviewProvider.swift
//  Threads
//
//  Created by Ricky Silitonga on 26/08/23.
//

import SwiftUI

struct DeveloperPreview {
    static let shared = DeveloperPreview()
    
    
    let user = User(id: "", email: "rickysilitonga1101@gmail.com", fullName: "Ricky Silitonga", userName: "rckylrnd")
}

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}
