//
//  CircularProfileImage.swift
//  Threads
//
//  Created by Ricky Silitonga on 19/08/23.
//

import SwiftUI

struct CircularProfileImage: View {
    let image: String
    
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 40,height: 40)
            .clipShape(Circle())
    }
}

struct CircularProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImage(image: "profile-img")
    }
}
