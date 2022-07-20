//
//  SeguePresentViewController.swift
//  UIKitScreenTransitionExample
//
//  Created by Shin yongjun on 2022/07/21.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
