//
//  StoryModel.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import Foundation

struct StoryModel {
    
    let storyByIDModel: StoryByIDModel
    
    var id: Int { return storyByIDModel.id }
    
    var title: String { return storyByIDModel.title }
    
    var url: String { return storyByIDModel.url }
}
