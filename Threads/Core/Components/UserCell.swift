//
//  UserCell.swift
//  Threads
//
//  Created by Ricky Silitonga on 19/08/23.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImage(image: "profile-img")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.userName)
                    .fontWeight(.semibold)
                
                Text(user.fullName)
            }
            .font(.footnote)
            
            Spacer()
            
            Button {
                // follow
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }

        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
