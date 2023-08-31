//
//  User.swift
//  Threads
//
//  Created by Ricky Silitonga on 23/08/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let email: String
    let fullName: String
    let userName: String
    var profileImageUrl: String?
    var bio: String?
}
