//
//  HackerNewsAPIApp.swift
//  HackerNewsAPI
//
//  Created by PaulmaX on 12.12.22.
//

import SwiftUI

@main
struct HackerNewsAPIApp: App {
    
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            StoryListView()
        }
    }
}
