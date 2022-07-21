//
//  SeguePushViewController.swift
//  UIKitScreenTransitionExample
//
//  Created by Shin yongjun on 2022/07/21.
//

import UIKit

class SeguePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }

    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        // 뒤로 돌아가기
        self.navigationController?.popViewController(animated: true)
        // 루트뷰로 돌아가기
//        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
