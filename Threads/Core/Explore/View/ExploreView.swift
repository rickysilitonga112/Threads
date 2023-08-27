//
//  ExploreView.swift
//  Threads
//
//  Created by Ricky Silitonga on 18/08/23.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.users, id: \.self) { user in
                        NavigationLink(value: user) {
                            VStack(alignment: .leading) {
                                UserCell(user: user)
                                    .padding(.horizontal)
                                
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                // goto profile view and pass the user
                ProfileView(user: user)
                    .navigationBarTitleDisplayMode(.inline)
            })
            .searchable(text: $searchText)
            .navigationTitle("Search")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
