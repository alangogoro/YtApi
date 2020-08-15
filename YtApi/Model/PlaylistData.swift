//
//  PlaylistData.swift
//  YtApi
//
//  Created by usr on 2020/8/14.
//

import Foundation

// MARK: - PlaylistData
struct PlaylistData: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let snippet: Snippet
    let contentDetails: ContentDetails
}

// MARK: - ContentDetails
struct ContentDetails: Codable {
    let videoId: String
}

struct Snippet: Codable {
    let title, channelTitle, description: String
    let thumbnails: Thumbnails
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let medium: Default
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

struct Video {
    let title: String
    let thumbNailUrl: URL
    let videoID: String
}
