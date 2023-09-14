//
//  CircularProfileImage.swift
//  Threads
//
//  Created by Ricky Silitonga on 19/08/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmal
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
            case .xxSmall: return 28
            case .xSmal: return 32
            case .small: return 40
            case .medium: return 48
            case .large: return 64
            case .xLarge: return 80
        }
    }
}

struct CircularProfileImage: View {
    let user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            // KFImage will caching the images
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color.gray.opacity(0.5))
        }
    }
}

struct CircularProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImage(user: dev.user, size: .small)
    }
}
