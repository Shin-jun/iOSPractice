//
//  ContentView.swift
//  EndCreditsView
//
//  Created by Shin yongjun on 2022/06/14.
//

import SwiftUI
//https://www.appcoda.com/star-wars-animated-text-swiftui/
struct ContentView: View {
    
    @State private var animationStart = false
    @State private var animationEnd = false
    // animation 지속시간
    private let startAnimationDuration = 5.0
    private let endAnimationDuration = 0.5
    @State var opacity: Double = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("영양사 Woody! \n운영자 Digi! \n이모 Bethev! \nHello EllyJ! \nHello Rang! \nHello Sophie! \nHello Everett!\n\n\n\n Thank you")
                .fontWeight(.bold)
                .font(.system(size: 30, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .truncationMode(.head)
                .lineSpacing(10)
                .padding()
            
            
                .rotation3DEffect(.degrees(animationEnd ? 0 : 20), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 3, x: 0, y: 10)
                .frame(width: 500, height: animationStart ? 750 : 0)
                //.animation(Animation.linear(duration: startAnimationDuration), value: opacity)
//                .animation(Animation.linear(duration: animationEnd ? endAnimationDuration : startAnimationDuration))
                .animation(Animation.linear(duration: startAnimationDuration), value: animationStart)
                .onAppear() {
                    self.animationStart.toggle()
                    opacity = 1
                    // animation 시간 후 animationEnd true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + self.startAnimationDuration) {
//                            self.animationEnd.toggle()
//
//                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
