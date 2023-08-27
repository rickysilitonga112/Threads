//
//  CurrentProfileActionButton.swift
//  Threads
//
//  Created by Ricky Silitonga on 28/08/23.
//

import SwiftUI

struct CurrentProfileActionButton: View {
    let text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 36)
                .background(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 2)
                }
        }
    }
}

struct CurrentProfileActionButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProfileActionButton(text: "Edit Profile", action: {})
    }
}
