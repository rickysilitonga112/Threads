//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Ricky Silitonga on 19/08/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    
    case threads
    case replies
    
    
    var title: String {
        switch self {
        case .threads:
            return "threads"
        case .replies:
            return "replies"
        }
    }
    
    var id: Int {return self.rawValue}
    
}
