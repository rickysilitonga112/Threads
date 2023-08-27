//
//  UserContentListView.swift
//  Threads
//
//  Created by Ricky Silitonga on 27/08/23.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter = ProfileThreadFilter.threads
    @State private var boldSelectedFilter = ProfileThreadFilter.threads
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.size.width / count - 20
    }
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(ProfileThreadFilter.allCases, id: \.self) { filter in
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
                ForEach(0...10, id: \.self) { _ in
                    FeedCell()
                }
            }
            
            .padding(.top, 16)
        }
    }
}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentListView()
    }
}