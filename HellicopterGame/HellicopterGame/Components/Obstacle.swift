//
//  Obstacle.swift
//  HellicopterGame
//
//  Created by Shin yongjun on 2022/04/24.
//

import SwiftUI

struct Obstacle: View {
    
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    var body: some View {
        
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(Color.green)
    }
    
}
