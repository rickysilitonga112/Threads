//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Ricky Silitonga on 27/08/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading) {
                        Text(user?.fullName ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(user?.userName ?? "")
                            .font(.subheadline)
                    }
                    
                    // if bio is not nil
                    if let bio = user?.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    
                    Text("2 followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                CircularProfileImage(image: "profile-img")
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
