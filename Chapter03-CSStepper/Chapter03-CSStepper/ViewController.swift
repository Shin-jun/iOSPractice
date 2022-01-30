//
//  ViewController.swift
//  Chapter03-CSStepper
//
//  Created by 신용준 on 2022/01/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        // CSStepper 객체 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        // ValueChange 이벤트가 발생하면 logging(_:) 메소드가 호출되도록
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        self.view.addSubview(stepper)
        let v = stepper.value
        print(v)
        
    }

    @objc func logging(_ sender: CSStepper) {
        NSLog("현재 스태퍼의 값은 \(sender.value)입니다")
              
    }

}

