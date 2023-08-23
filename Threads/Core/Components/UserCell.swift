//
//  UserCell.swift
//  Threads
//
//  Created by Ricky Silitonga on 19/08/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImage(image: "profile-img")
            
            VStack(alignment: .leading) {
                Text("rckylrnd")
                    .fontWeight(.semibold)
                
                Text("Ricky Silitonga")
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
        UserCell()
    }
}
