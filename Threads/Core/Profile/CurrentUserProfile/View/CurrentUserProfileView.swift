//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by Ricky Silitonga on 27/08/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ProfileHeaderView(user: viewModel.currentUser)
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .modifier(CurrentProfileActionButtonModifier())
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Share Profile")
                            .modifier(CurrentProfileActionButtonModifier())
                    }
                }
                
                .padding(.bottom, 6)

                // profile filter section
                UserContentListView()
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // logout
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(Color.black)
                    }
                }
            }
        }

    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
