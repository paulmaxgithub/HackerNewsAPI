//
//  StoryDetailViewModel.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Combine

final class StoryDetailViewModel: ObservableObject {
    
    public var storyID: Int
    public var title: String { return story.title }
    public var url: String { return story.url }
    
    private var cancellable: AnyCancellable?
    
    @Published var story: StoryByIDModel!
    
    init(storyID: Int) {
        self.storyID = storyID
        
        cancellable = WebService.getStoryByID(storyID: storyID)
            .catch { _ in Just(StoryByIDModel.placeholder()) }
            .sink(receiveCompletion: { _ in }) { [unowned self] storyByIDModel in
                story = storyByIDModel
            }
    }
}
