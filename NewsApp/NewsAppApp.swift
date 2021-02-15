//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Scott on 2/7/21.
//

import SwiftUI

@main
struct NewsAppApp: App {
    
    init() {
        URLCache.shared.memoryCapacity = 25_000_000
        URLCache.shared.diskCapacity = 50_000_000
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
