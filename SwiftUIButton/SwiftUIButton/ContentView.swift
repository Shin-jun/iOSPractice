//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Shin yongjun on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("버튼 클릭")
        } label: {
            HStack {
                Text("Log in")
                
                Image(systemName: "arrow.right.circle")
            }
        }
        .buttonStyle(MyButtonStyle())

    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding()
            .background(.pink)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.pink, lineWidth: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
