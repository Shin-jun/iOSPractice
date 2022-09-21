//
//  ViewController.swift
//  RestAPI
//
//  Created by Shin yongjun on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {

    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        apiService.getPopularMoviesData { (result) in
            print(result)
        }
    }


}

