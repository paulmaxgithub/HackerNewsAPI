//
//  StoryDetailViewModel.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Combine

final class StoryDetailViewModel: ObservableObject {
    
    @Published var story = StoryByIDModel.placeholder()
    
    public var title: String { return story.title }
    public var url: String { return story.url }
    
    private var cancellable: AnyCancellable?
    
    public func fetchStoryDetailsBy(_ id: Int) {
        cancellable = WebService.getStoryByID(storyID: id)
            .catch { _ in Just(StoryByIDModel.placeholder()) }
            .sink(receiveCompletion: { _ in }) { [unowned self] storyByIDModel in
                story = storyByIDModel
            }
    }
}
