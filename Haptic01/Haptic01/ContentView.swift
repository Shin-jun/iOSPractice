//
//  ContentView.swift
//  Haptic01
//
//  Created by Shin yongjun on 2022/06/09.
//

import CoreHaptics  
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onTapGesture(perform: simpleSuccess)
        
   }
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
