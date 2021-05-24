//
//  ViewController.swift
//  ImageViewer
//
//  Created by 신용준 on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var prBtn: UIButton!
    @IBOutlet var nxBtn: UIButton!
    
    var maxImage = 2
    var numImage = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func prBtn(_ sender: UIButton) {
        numImage = numImage - 1
        if(numImage < 1) {
            numImage = maxImage
        }
        let imageName = String(numImage) + ".jpeg"
        ImageView.image = UIImage(named:imageName)
    }
    
    @IBAction func nxBtn(_ sender: UIButton) {
        numImage = numImage + 1
        if(numImage > maxImage) {
            numImage = 1
        }
        let imageName = String(numImage) + ".jpeg"
        ImageView.image = UIImage(named:imageName)
    }
}

