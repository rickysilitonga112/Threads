//
//  EditProfileViewModel.swift
//  Threads
//
//  Created by Ricky Silitonga on 31/08/23.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    
    func uploadUserData() async throws {
        print("DEBUG: Upload user data...")
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let profileItem = selectedItem else { return }
        
        guard let data = try? await profileItem.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        // call the function to upload the image to firebase storage
        guard let uiImage = self.uiImage else { return }
        guard let imageURL = try await ImageUploader.uploadImage(uiImage) else { return }
        
        // add the imageURL path to firestore user collection
        try await UserService.shared.updateUserData(withImageUrl: imageURL)
    }
    
}
