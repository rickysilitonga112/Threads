//
//  ImageUploader.swift
//  Threads
//
//  Created by Ricky Silitonga on 01/09/23.
//

import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        
        // prepare for the unique file name to make it easy to find the image later on
        let fileName = NSUUID().uuidString
        
        // firebase storage path reference
        let storageReference = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        do {
            let _ = try await storageReference.putDataAsync(imageData)
            let url = try await storageReference.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Error to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
