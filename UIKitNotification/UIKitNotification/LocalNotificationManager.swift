//
//  LocalNotificationManager.swift
//  UIKitNotification
//
//  Created by Shin yongjun on 2022/11/22.
//

import NotificationCenter

struct LocalNotificationManager {
    var id: String
    var busNumber: String
    var body: String
    var time: Int
    var repeats: Bool

    init(id: String, busNumber: String = "", body: String = "", time: Int = 0, repeats: Bool = false) {
        self.id = id
        self.busNumber = busNumber
        self.body = body
        self.time = time
        self.repeats = repeats
    }
}
