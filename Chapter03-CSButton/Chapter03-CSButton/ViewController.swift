//
//  ViewController.swift
//  Chapter03-CSButton
//
//  Created by 신용준 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let csBtn = CSButton()
        csBtn.frame = CGRect(x: 30, y: 50, width: 150, height: 30)
        
        self.view.addSubview(csBtn)
        
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30, y: 200, width: 150, height: 30)
        
        self.view.addSubview(rectBtn)
        
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 200, width: 150, height: 30)
        
        self.view.addSubview(circleBtn)
        
    }


}

