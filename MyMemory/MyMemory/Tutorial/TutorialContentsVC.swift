//
//  TutorialContentsVC.swift
//  MyMemory
//
//  Created by 신용준 on 2022/02/24.
//

import UIKit
class TutorialContentsVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImageVIew: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    @IBAction func close(_ sender: Any) {
        let ud = UserDefaults.standard
        ud.set(true, forKey: UserInfoKey.tutorial)
        ud.synchronize()
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        // 이미지를 꽉 채울 수 있게
        self.bgImageVIew.contentMode = .scaleAspectFill
        
        // 전달받은 타이틀 정보를 레이블 객체에 대입하고 크기를 조절
        self.titleLabel.text = self.titleText
        self.titleLabel.sizeToFit() // 레이블너비를 텍스트 너비에 맞게
        
        // 전달 받은 이미지 정보를 이미지 뷰에 대입한다.
        self.bgImageVIew.image = UIImage(named: self.imageFile)
    }
}
