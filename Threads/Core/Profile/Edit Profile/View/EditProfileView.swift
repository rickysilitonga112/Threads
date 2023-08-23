//
//  EditProfileView.swift
//  Threads
//
//  Created by Ricky Silitonga on 21/08/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivate = false
    
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
                        
                        CircularProfileImage(image: "profile-img")
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
                        // cancel
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
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
    }
}
