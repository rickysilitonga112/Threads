//
//  EditProfileView.swift
//  Threads
//
//  Created by Ricky Silitonga on 21/08/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject var viewModel = EditProfileViewModel()
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivate = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.horizontal, .bottom])
                
                // area of name and profile image
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Ricky Silitonga")
                                .fontWeight(.semibold)
                            
                            Text("rckylnrd")
                        }
                        .font(.footnote)
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImage(user: nil, size: .small)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // bio field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    // Link field
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your link", text: $link, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    // private profile
                    Toggle(isOn: $isPrivate) {
                        Text("Private Profile")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .black.opacity(0.5)))
                    
                    Divider()
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // save all the changes to firebase
                        Task {
                            try await viewModel.uploadUserData()
                        }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(CurrentUserProfileViewModel())
    }
}
