//
//  ViewController.swift
//  UIKitURLDataTask
//
//  Created by Shin yongjun on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // 공유 세션(싱글톤) -> 사용자 정의가 불가능
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
        let defaultSession = URLSession(configuration: .default).dataTask(with: url) { data, response, error in
             //디스크에 어떤 데이터도 저장하지 않고 메모리에 올려 세션과 연결합니다. 따라서 앱이 세션을 만료시키면 세션과 관련된 데이터가 사라집니다.
             //쿠키나 캐시를 저장하지 않는 비공개 세션으로 사용됩니다.
            let ephemeralSession = URLSession(configuration: .ephemeral).dataTask(with: url) { data, respone, error in
                
            }
             //Suspended나 terminated 상태에서도 백그라운드에서 업로드, 다운로드가 가능합니다.
             let backgroundSession = URLSession(configuration: .background)

                        if let error = error {
                print("There was an error \(error.localizedDescription)")
            } else {
                let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response: \(jsonResponse)")
            }
        }.resume()
        
        
    }


}

func apiCall() {
     
}
