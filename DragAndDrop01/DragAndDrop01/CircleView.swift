//
//  CircleView.swift
//  DragAndDrop01
//
//  Created by Shin yongjun on 2022/06/10.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color
    
    var body: some View {
        
        Rectangle()
            .fill(color)
            .frame(width: 100, height: 100)
        
    }
}

