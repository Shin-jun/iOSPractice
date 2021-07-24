import UIKit

var greeting = "Hello, playground"


// URLSession

// 1. URLSessionConfiguartion
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "Gdragon")

urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
        
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumnailPath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumnailPath = "artworkUrl130"
        
    }
    
}


let dataTask = session.dataTask(with: requestURL) { (data, respnse, error) in
    guard error == nil else { return }
    
    guard let statusCode = (respnse as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    
    // 목표 : 트랙리스트 오브젝트로 가져오기
    
    // - Data -> Track 목록으로 가져오고 싶다. [Track]
    // - Track 오브젝트 만들기
    // - Data에서 struct로 파싱하고 싶다 > Codable을 이용해서 만들기
    //   - Json 파일, 데이터 > 오브젝트로 만들떄 (Codable 이용하겠다.)
    //   - Response, Track 두개 만들기
    
    // 해야할일
    // - Resoponse, Trak struct
    // - struct의 프로퍼티 이름과 실제 데이터의 키와 맞추기 (Codable 디코딩하게 하기 위해서)
    // - 파싱하기 (Decoding)
    // - 트랙리스트 가져오기
    
    
    
    // 파싱 및 트랙 가져오기
    do {
    let decoder = JSONDecoder()
    let response = try decoder.decode(Response.self, from: resultData)
    let tracks = response.tracks
        
    print("--> tracks: \(tracks.count) - \(tracks.last?.title), \(tracks.last?.thumnailPath)")
    } catch let error {
        print("--> error: \(error.localizedDescription)")
    }
    print("---> result : \(resultData)")
}

dataTask.resume()
