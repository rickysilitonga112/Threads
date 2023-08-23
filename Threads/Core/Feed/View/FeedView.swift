//
//  FeedView.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(0...10, id: \.self) { threads in
                        FeedCell()
                    }
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .refreshable{
                print("User refresh the feed view")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("refres tab bar button tapped")
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
