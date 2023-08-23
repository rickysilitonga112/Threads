//
//  AddThreadView.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct AddThreadView: View {
    @Binding var presentAddThread: Bool
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularProfileImage(image: "profile-img")
                    
                    VStack(alignment: .leading) {
                        Text("Ricky Silitonga")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            // show only if the thread != ""
                            caption = ""
                            
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding(.all)
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .opacity(caption.isEmpty ? 0.5 : 1)
                    }
                }
            }
        }
        
    }
}

struct AddThreadView_Previews: PreviewProvider {
    static var previews: some View {
        AddThreadView(presentAddThread: .constant(true))
    }
}
