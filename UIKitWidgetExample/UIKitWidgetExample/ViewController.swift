//
//  ViewController.swift
//  UIKitWidgetExample
//
//  Created by Shin yongjun on 2022/11/29.
//

import UIKit

class ViewController: UIViewController {

    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text"
        field.backgroundColor = .white
        return field
    }()

    // 위젯에 데이터를 전달할 버튼
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Save", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(field)
        view.addSubview(button)
        field.becomeFirstResponder()

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        field.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.frame.size.width - 40, height: 52)
        button.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 70, width: view.frame.size.width-60, height: 50)
    }

    @objc private func didTapButton() {
        field.resignFirstResponder()

        let userDefaults = UserDefaults(suiteName: "group.widgetcache")

        guard let text = field.text, !text.isEmpty else {
            return
        }

        userDefaults?.setValue(text, forKey: "text")
    }


}

