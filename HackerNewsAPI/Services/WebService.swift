//
//  WebService.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Foundation
import Combine

final class WebService {
    
    static func getAllTopStories() -> AnyPublisher<[StoryByIDModel], Error> {
        
        let stringURL = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
        
        guard let url = URL(string: stringURL) else { fatalError("Error, invalid URL!") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map { $0.data }
            .decode(type: [Int].self, decoder: JSONDecoder())
            .flatMap({ storyIDs in
                return mergeStoriesToGetTitle(storyIDs)
            })
            .scan([], { stories, story -> [StoryByIDModel] in
                return stories + [story]
            })
            .eraseToAnyPublisher()
    }
    
    static func getStoryByID(storyID: Int) -> AnyPublisher<StoryByIDModel, Error> {
        
        let stringURL = "https://hacker-news.firebaseio.com/v0/item/\(storyID).json?print=pretty"
        
        guard let url = URL(string: stringURL) else { fatalError("Error, invalid URL")}
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map { $0.data }
            .decode(type: StoryByIDModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private static func mergeStoriesToGetTitle(_ storyIds: [Int]) -> AnyPublisher<StoryByIDModel, Error> {
        
        let storyIDs = Array(storyIds.prefix(50))
        let initialPublisher = getStoryByID(storyID: storyIDs[0])
        let remainder = Array(storyIDs.dropFirst())
        
        return remainder.reduce(initialPublisher) { partialResult, id in
            return partialResult.merge(with: getStoryByID(storyID: id))
                .eraseToAnyPublisher()
        }
    }
}
