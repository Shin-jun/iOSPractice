//
//  CSLogButton.swift
//  MyMemory
//
//  Created by 신용준 on 2022/01/31.
//

import UIKit
public enum CSLogType: Int {
    case basic // 기본 로그 타입
    case title // 버튼의 타이틀을 출력
    case tag // 버튼의 태그값을 출력
}
public class CSLogButton: UIButton {
    // 로그 출력 타입
    public var logType: CSLogType = .basic
    
    // 초기화 메소드 정의
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = .white
        
        // 버튼의 클릭 이벤트에 logging 메소드를 연결
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    // 로그를 출력하는 액션 메소드
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
            case .basic: // 단순히 로그만 출력
                NSLog("버튼이 클릭되었습니다.")
            case .title: // 로그에 버튼의 타이틀을 출력
                let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"
                NSLog("\(btnTitle) 버튼이 클릭되었습니다.")
            case .tag: // 로그에 버튼 태그 출력
                NSLog("\(sender.tag)버튼이 클릭되었습니다.")
        }
    }
}
