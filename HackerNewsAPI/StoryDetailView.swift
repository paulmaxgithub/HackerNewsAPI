//
//  StoryDetailView.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject var viewModel: StoryDetailViewModel
    
    private let storyID: Int
    
    init(storyID: Int) {
        self.storyID = storyID
        viewModel = StoryDetailViewModel()
    }
    
    var body: some View {
        
        VStack {
            Text(viewModel.title)
                .padding(15)
                .font(.largeTitle)
            WebView(url: viewModel.url)
        }
        .onAppear {
            viewModel.fetchStoryDetailsBy(storyID)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyID: 8863)
    }
}
