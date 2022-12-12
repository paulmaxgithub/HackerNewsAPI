//
//  WebService.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Foundation
import Combine

final class WebService {
    
    static func getAllTopStories() -> AnyPublisher<[Int], Error> {
        
        let stringURL = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
        
        guard let url = URL(string: stringURL) else { fatalError("Error, invalid URL!") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map { $0.data }
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
