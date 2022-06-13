//
//  ContentView.swift
//  StateAndBinding01
//
//  Created by Shin yongjun on 2022/06/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    @State private var progress: Double = 65.0
    @State private var time: Int = 188
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
                
                Text("Title")
            }
            VStack {
                ProgressView("", value: progress, total: 188)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                
                HStack {
                    Text("\(Int(progress)/60):\(String(format: "02d", Int(progress)%60))")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("\(time/60):\(String(format: "%02d", time%60))")
                        .fontWeight(.bold)
                }
            }
            .frame(width: 350)
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
