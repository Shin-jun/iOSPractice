//
//  ViewController.swift
//  UIKitNotification
//
//  Created by Shin yongjun on 2022/11/15.
//

import UIKit
import UserNotifications



class ViewController: UIViewController {

    var time = 5
    var tiggertiti = LocalNotificationManager.init(id: "1", busNumber: "207", body: "207", time: 10, repeats: false)
    var tiggertititi = LocalNotificationManager.init(id: "2", busNumber: "306", body: "306", time: 20, repeats: false)
    lazy var notifications: [LocalNotificationManager] = [tiggertiti, tiggertititi]

    override func viewDidLoad() {
        super.viewDidLoad()
        // 사용자 권한 받기
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound], completionHandler: {didAllow,Error in
            print(didAllow)
        })
       
        UNUserNotificationCenter.current().delegate = self
    }

    @IBAction func buttonPressedbuttonPressed(_ sender: UIButton) {
        boardingNotification()
        print("ButtonPressed")
    }

    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

    }

    @IBAction func customNoti(_ sender: UIButton) {
        timeNotification()
    }

    @IBAction func callNoti(_ sender: UIButton) {
        timeCallNotification(id: "1", busNumber: "207")
    }

    func boardingNotification() {
        // 알람 내용
            let content = UNMutableNotificationContent()
            content.title = "이번 정류장은 포스텍정류장입니다."
            //content.subtitle = "목적의 전전 정류장입니다."
            content.body = "도착까지 2정류장 남았습니다."

            // 트리거 time초뒤알람
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats:false)
            // 알람 요청
            let request = UNNotificationRequest(identifier: "123", content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

    }

    func timeNotification() {
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = "\(notification.busNumber)번 버스가 곧 도착합니다."
            content.body = "\(notification.body)버스가 전전 정류장입니다."

            let triggerTime = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(notification.time), repeats: notification.repeats)

            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: triggerTime)

            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Notification ID = \(notification.id)")
            }

        }

    }

    func timeCallNotification(id: String, busNumber: String) {
            let content = UNMutableNotificationContent()
            content.title = "\(busNumber)번 버스가 곧 도착합니다."
            content.body = "\(busNumber)버스가 전전 정류장입니다."

            let triggerTime = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

            let request = UNNotificationRequest(identifier: id, content: content, trigger: triggerTime)

            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Notification ID = \(id)")

        }

    }
}

extension ViewController: UNUserNotificationCenterDelegate {

    // 포어그라운드에 있을 때도 알람
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
//        let settingsViewController = UIViewController()
//        settingsViewController.view.backgroundColor = .gray
//        self.present(settingsViewController, animated: true, completion: nil)
//    }
}
