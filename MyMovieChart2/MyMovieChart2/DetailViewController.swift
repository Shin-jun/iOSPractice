//
//  DetailViewController.swift
//  MyMovieChart2
//
//  Created by 신용준 on 2021/12/27.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수
 
    override func viewDidLoad() {
        // WKNavigationDelegate 의 델리게이트 객체를 지정
        self.wv.navigationDelegate = self
        
        NSLog("linkurl = \(self.mvo.detail!), title=\(self.mvo.title!)")
        
        // 내비게이션 바의 타이틀에 영화명을 출력
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        // URLRequest 인스턴스 생성
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        // loadRequest 메소드를 호출하면서 req를 인자값으로 전달
        self.wv.load(req)
    }
}

// MARK:- WKNavigationDelete 프로토콜 구현
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating() // 인디게이터 뷰의 애니메이션을 실행
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("상세 페이지를 읽어오지 못했습니다") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}

// MARK:- 심플한 경고창 함수 정의용 익스텐션
extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}
