//
//  Post.swift
//  UIKitAlamofireDemo
//
//  Created by Shin yongjun on 2022/09/20.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
