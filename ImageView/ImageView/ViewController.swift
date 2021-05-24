//
//  ViewController.swift
//  ImageView
//
//  Created by 신용준 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false      // 이미지 확대 여부를 나타내는 bool타입의 변수
    var imgOn: UIImage?     // 미니언즈1 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff: UIImage?    // 미니언즈2 이미지를 가지고 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView!     // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton!      // 버튼에 대한 아웃렛 변수
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "image.jpeg")    // imgOn에 미니언즈 이미지 할당
        imgOff = UIImage(named: "image2.jpeg")  // imgOff에 미니언즈 이미지 할당
        
        imgView.image = imgOn   // 위에서 할당한 이미지를 imgView에 할당
    }

    // 확대 축소 버튼에 대한 액션 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0                     // 확대할 배율 값
        var newWidth:CGFloat, newHeight:CGFloat     // 확대할 크기의 계산값을 보관할 변수
        
        if(isZoom){                                 // true 현재 확대된 그림일 경우(타이틀은 축소)
            newWidth = imgView.frame.width/scale    // 이미지 뷰의 프레임 너비갑을 scale로 나눔
            newHeight = imgView.frame.height/scale  // 높이를 나눔
            btnResize.setTitle("확대", for: .normal)  // 버튼의 타이틀을 확대로 변경
        }else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        // 이미지 뷰의 프레임의 크기를 수정된 너비와 높이로 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom    // isZoom 변수의 상태를 반전
    }
    
    // On/Off 스위치에 대한 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
}

