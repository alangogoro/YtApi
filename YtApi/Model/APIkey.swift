//
//  APIkey.swift
//  YtApi
//
//  Created by usr on 2020/8/14.
//

import Foundation

struct PropertyKeys {
    static let youtubeAPIKey = "AIzaSyAYSNV7q3R3TJxPVwvJwDMfEANidtcar60"
    // 取得頻道的資訊（包含影片清單）
    static let urlChannelStr = """
https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=UCzjNxGvrqfxL9KGkObbzrmg&key=AIzaSyAYSNV7q3R3TJxPVwvJwDMfEANidtcar60
"""
    /* 取得影片清單
     * maxResults = 回傳影片數量（最大50）*/
    static let urlPlaylistStr = """
https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UUzjNxGvrqfxL9KGkObbzrmg&key=AIzaSyAYSNV7q3R3TJxPVwvJwDMfEANidtcar60&maxResults=30
"""
    static let cellId = "videoCell"
}

/* ==========  ========== */
