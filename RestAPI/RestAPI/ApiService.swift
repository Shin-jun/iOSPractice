//
//  ApiService.swift
//  RestAPI
//
//  Created by Shin yongjun on 2022/08/25.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    // URL에서 데이터를 가져오는 메소드
    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        
        // URL
        let popularMoviesURL =
            "https://api.themoviedb.org/3/movie/popular?api_key=8040c691aca0c3af1f50271d825922ac&language=en-US&page=1"
        
        guard let url = URL(string: popularMoviesURL) else { return }
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code : \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the Data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
