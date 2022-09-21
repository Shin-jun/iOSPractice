//
//  InterfaceController.swift
//  UIKitWCSessionWatch WatchKit Extension
//
//  Created by Shin yongjun on 2022/07/30.
//

import WatchKit
import Foundation
import WatchConnectivity
import HealthKit

class InterfaceController: WKInterfaceController {
    
    // 1. Session property WCSession을 사용하여 세션 속성을 만듭니다.
    private var session = WCSession.default
    
    @IBOutlet weak var label: WKInterfaceLabel!
    
    private func updateLabel() {
        label.setText("hello")
    }
    
    // IBAction을 사용해 SendMessage()메서드를 생성, iPhone에 필요한 모든 것을 요청할 수 있다.
    @IBAction func sendMessage() {
        
        if isReachable() {
            session.sendMessage(["requesst" : "version"], replyHandler : { (response) in
                self.items.append("Reply: \(response)")
            }, errorHandler: { (error) in
                print("Error sending message: %@", error)
            })
        } else {
            print("iPhone is not reahable!")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    // 워치가 켜졌을때
    override func willActivate() {
        super.willActivate()
        
        // 2. Initialization of session and set as delegate this InterfaceController if it's surported
        if isSuported() {
            session.delegate = self
            session.activate()
        }
    }
    
    private func isSuported() -> Bool {
        return WCSession.isSupported()
    }
    
    private func isReachable() -> Bool {
        return session.isReachable
    }
    
    // 워치가 꺼질때
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // 1. We launch a sound and a vibration
        WKInterfaceDevice.current().play(.notification)
        // 2. Get message and append to list
        let msg = message["msg"]!
        self.items.append("\(msg)")
    }

}


extension InterfaceController: WCSessionDelegate {
    
    // 4. Required stub for delegationg session
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) errror: \(String(describing: error))")
    }
}
