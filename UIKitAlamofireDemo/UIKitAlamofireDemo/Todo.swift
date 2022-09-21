//
//  NetworkingClient.swift
//  UIKitAlamofireDemo
//
//  Created by Shin yongjun on 2022/09/20.
//

import Foundation

struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
