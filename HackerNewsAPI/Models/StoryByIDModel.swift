//
//  StoryByIDModel.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Foundation

struct StoryByIDModel: Decodable {
    
    let id: Int
    let title: String
    let url: String
}

extension StoryByIDModel {
    
    static func placeholder() -> Self {
        return StoryByIDModel(id: 0, title: "N/A", url: "")
    }
}
