//
//  ViewController.swift
//  UIKitAutoLayout
//
//  Created by Shin yongjun on 2022/11/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.backgroundColor = UIColor.yellow
        button.backgroundColor = UIColor.black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        var constraintX: NSLayoutConstraint = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        var constraintY: NSLayoutConstraint = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        constraintX.isActive = true
        constraintY.isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        var buttonConstraintX: NSLayoutConstraint = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        var topConstarintX: NSLayoutConstraint = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)
        buttonConstraintX.isActive = true
        topConstarintX.isActive = true
        
        var widthConstraint: NSLayoutConstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 2.0)
        widthConstraint.isActive = true
    }


}

