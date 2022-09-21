//
//  ApiService.swift
//  UIKitAlamofireDemo
//
//  Created by Shin yongjun on 2022/09/20.
//

import Foundation
import Combine

// API 호출
enum API {
    case fetchTodos // 할일 가져오기
    case fetchPosts // 포스트 가져오기
    
    var url: URL {
        switch self {
        case .fetchPosts: return URL(string: "https://jsonplaceholder.typicode.com/posts")!
        case .fetchTodos: return URL(string: "https://jsonplaceholder.typicode.com/todos")!
            
        }
    }
}

enum ApiService {
    static func fetchTodos() -> AnyPublisher<[Todo], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchTodos.url)
            .map{ $0.data }
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func fetchPosts() -> AnyPublisher<[Post], Error> {
        return URLSession.shared.dataTaskPublisher(for: API.fetchPosts.url)
            .map{ $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
