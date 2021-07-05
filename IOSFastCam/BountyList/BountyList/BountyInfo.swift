//
//  BountyInfo.swift
//  BountyList
//
//  Created by 신용준 on 2021/07/04.
//

import UIKit

struct BountyInfo {
let name: String
let bounty: Int

var image: UIImage? {
    return UIImage(named: "\(name).jpg")
}

init(name: String, bounty: Int) {
    self.name = name
    self.bounty = bounty

    }
}
