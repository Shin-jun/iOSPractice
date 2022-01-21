//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 신용준 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 객체 생성, 속성 설정
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        btn.center = CGPoint(x: self.view.frame.size.width/2 , y: 100)
        
        self.view.addSubview(btn)
        
        // 버튼의 이벤트와 메소드 btnOnClick(_:)을 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        
        
    }
    
    @objc func btnOnClick(_ sender: Any) {
        // 호출할 객체가 버튼이라면
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다", for: .normal)
        }
    }

}

