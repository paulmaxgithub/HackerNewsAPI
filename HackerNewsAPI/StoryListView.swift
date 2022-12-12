//
//  StoryListView.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import SwiftUI

struct StoryListView: View {
    
    @ObservedObject private var viewModel = StoryListViewModel()
    
    var body: some View {
        
        NavigationView {
            List(viewModel.stories, id: \.id) { storyModel in
                
                NavigationLink(destination: StoryDetailView(storyID: storyModel.id)) {
                    Text("\(storyModel.id)")
                }
            }
            .navigationTitle("Hacker News")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
