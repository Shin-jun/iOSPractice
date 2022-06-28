//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by Shin yongjun on 2022/06/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack {
            Button("Delete selection") {
                print("Now Deleting")
            }
            Button("Delete selection", role: .destructive, action: executeDelete)
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            Button {
                print("Tap")
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .symbolRenderingMode(.hierarchical)
            //.renderingMode(.origin) 원본이미지 그대로 가져오기
        }
    }
    
    func executeDelete() {
        print("Now Deleting")
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
