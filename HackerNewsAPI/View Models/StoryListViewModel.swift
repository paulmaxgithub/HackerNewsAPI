//
//  StoryListViewModel.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Combine

final class StoryListViewModel: ObservableObject {
    
    @Published var stories = [StoryModel]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        cancellable = WebService.getAllTopStories()
            .map { storyIDs in
                storyIDs.compactMap { StoryModel.init(id:$0) }
            }
            .sink(receiveCompletion: { _ in }) { [unowned self] fetchedStories in
                stories = fetchedStories
            }
    }
}
