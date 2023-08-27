//
//  CurrentProfileActionButtonModifier.swift
//  Threads
//
//  Created by Ricky Silitonga on 28/08/23.
//

import SwiftUI

struct CurrentProfileActionButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 2)
            }
            .cornerRadius(8)
    }
}

