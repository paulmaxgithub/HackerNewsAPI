//
//  StoryDetailView.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import SwiftUI

struct StoryDetailView: View {
    
    @ObservedObject var viewModel: StoryDetailViewModel
    
    init(storyID: Int) {
        viewModel = StoryDetailViewModel(storyID: storyID)
    }
    
    var body: some View {
        
        VStack {
            Text(viewModel.title)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyID: 8863)
    }
}
