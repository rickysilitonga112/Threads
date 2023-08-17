//
//  ThreadsTextFieldModifier.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .autocorrectionDisabled()
    }
}
