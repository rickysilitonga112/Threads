//
//  ProfileView.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProfileHeaderView(user: user)
            
            Button {
                // follow
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 36)
                    .background(.black)
                    .cornerRadius(8)
            }
            
            // profile filter section
            UserContentListView()
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
