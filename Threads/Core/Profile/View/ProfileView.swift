//
//  ProfileView.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct ProfileView: View {
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.size.width / count - 20
    }
    
    @State private var selectedFilter = ProfileThreadFilter.threads
    @State private var boldSelectedFilter = ProfileThreadFilter.threads
    
    @Namespace var animation
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading) {
                            Text("Lewis Hamilton")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("lewis.hamilton")
                                .font(.subheadline)
                        }
                        
                        Text("Formula one driver for lamborghini")
                            .font(.footnote)
                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    CircularProfileImage(image: "profile-img")
                }
            }
            
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
            VStack {
                HStack(spacing: 0) {
                    ForEach(ProfileThreadFilter.allCases) { filter in
                        VStack {
                            Text(filter.title.capitalized)
                                .font(.subheadline)
                                .fontWeight(boldSelectedFilter == filter ? .semibold : .regular)
                            
                            if selectedFilter == filter {
                                Rectangle()
                                    .frame(width: filterBarWidth, height: 3)
                                    .matchedGeometryEffect(id: "filter", in: animation)
                            } else {
                                Rectangle()
                                    .frame(width: filterBarWidth, height: 3)
                                    .foregroundColor(.clear)
                            }
                        }
                        .onTapGesture {
                            // need this separate from withAnimation to fix the delay bug on text bold transition
                            boldSelectedFilter = filter
                            
                            withAnimation(Animation.spring()) {
                                selectedFilter = filter
                            }
                        }
                    }
                }
                
                LazyVStack {
                    ForEach(0...15, id: \.self) { _ in
                        FeedCell()
                    }
                }
                
                .padding(.top, 16)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
