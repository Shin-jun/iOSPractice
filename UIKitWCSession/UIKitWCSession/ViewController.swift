//
//  ViewController.swift
//  UIKitWCSession
//
//  Created by Shin yongjun on 2022/07/30.
//

import UIKit

class ViewController: UIViewController {

    // 1. Get singleton class whitch manage WCSession
    var connectivityHandler = SessionHandler.shared
    
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var onClickReset: UIButton!
    @IBAction func onClickRese(_ sender: Any) {
        self.lblContent.text = "Label"
    }
    
    // 2. Counter for manage number of messages sended
    var messagesCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        messagesCounter += 1
        
        // 3: Send message to apple watch, we don't wait to response, only trace errors
        connectivityHandler.session.sendMessage(["msg" : "Message \(messagesCounter)"], replyHandler: nil) { (error) in
            print("Error sending message: \(error)")
        }
        
    }
    

}

