//
//  ViewController.swift
//  TimerDemo
//
//  Created by Shin yongjun on 2022/08/28.
//

import UIKit

class ViewController: UIViewController {

    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemGray,
        .systemPink
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    
    func createTimer() {
//        let timer = Timer.scheduledTimer(
//            timeInterval: 2,
//            target: self,
//            selector: #selector(fireTimer),
//            userInfo: nil,
//            repeats: true
//        )
//        timer.tolerance = 200
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
//            timer.fire()
//        })
        //var ran = 1
        var isAnimated = false
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.addSubview(myView)
        myView.center = view.center
        myView.backgroundColor = .link
        
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] timer in
//            print("Excuted timer: \(ran)")
//            if ran >= 10 {
//                timer.invalidate()
//                print("Timer stopped")
//            }
            
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                self?.view.backgroundColor = self?.colors.randomElement() ?? .clear
                //ran += 1
                if isAnimated {
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                        myView.center = strongSelf.view.center
                    }
                    isAnimated = false
                } else {
                    UIView.animate(withDuration: 1) {
                        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                        myView.center = strongSelf.view.center
                    }
                    isAnimated = true
                }
            }
        }
        timer.fire()
    }
    
    @objc func fireTimer() {
        view.backgroundColor = colors.randomElement()
    }
    
}

