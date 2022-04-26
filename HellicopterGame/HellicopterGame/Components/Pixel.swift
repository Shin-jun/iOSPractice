//
//  Pixels.swift
//  HellicopterGame
//
//  Created by Shin yongjun on 2022/04/24.
//

import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
