//
//  ViewController.swift
//  SwiftsoupDemo
//
//  Created by Shin yongjun on 2022/08/25.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        crawl()
    }
}

func crawl() {
    let url = URL(string: "https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1&start=we")
    
    guard let myURL = url else { return }
    
    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let headerTitle = try doc.title()
        print(headerTitle)
        
        let firstLinkTitles:Elements = try doc.select(".bo3").select("b")
        
        for i in firstLinkTitles {
            print("title: ", try i.text())
        }
    } catch Exception.Error(let type, let message) {
        print("type: \(type)")
        print("Message: \(message)")
    } catch {
        print("error")
    }
}


func crawler() {
    let url = URL(string: "https://github.com/Shin-jun")
    
    guard let myURL = url else { return }
    
    do {
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let headerTitle = try doc.title()
        print(headerTitle)
        
        let firstLinkTitles:Elements = try doc.select(".svg-tip").select("strong")
        
        for i in firstLinkTitles {
            print("title: ", try i.text())
        }
    } catch Exception.Error(let type, let message) {
        print("type: \(type)")
        print("Message: \(message)")
    } catch {
        print("error")
    }
}
