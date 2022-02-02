//
//  FrontViewController.swift
//  Chpater04-SideBarDIY
//
//  Created by 신용준 on 2022/02/01.
//

import UIKit
class FrontViewController: UIViewController {
    // 사이드 바 오픈 기능을 위임할 델리게이트
    var delegate: RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이드 바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"),
                                         style: UIBarButtonItem.Style.plain,
                                         target: self,
                                         action: #selector(moveSide))
        
        // 버튼을 내비게이션 바의 왼쪽 영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
    }
    
    // 사용자의 액션에 따라 델리게이트 메소드를 호출한다.
    @objc func moveSide(_ sender: Any) {
        if self.delegate?.isSideBarShowing == false {
            self.delegate?.openSideBar(nil) // 사이드 바 연다.
        } else {
            self.delegate?.closeSideBar(nil) // 사이드 바 닫는다.
        }
    }
}
