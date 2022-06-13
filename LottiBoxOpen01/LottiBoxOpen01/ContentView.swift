//
//  ContentView.swift
//  LottiBoxOpen01
//
//  Created by Shin yongjun on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    @State private var dragCompleted = false
    @State private var showBox = true
    @State private var showInBox = false
    @State private var opac: Double = 0
    @State private var boxDec = "드래그해서 상자를 열어주세요"
    
    @State private var showBlack = false
    @State private var showWhite = true
    
    
    private let hapticProperties: [HapticProperty] = [
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.25, 0.3], sharpness: [0.85, 0.3]),
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.55, 0.3], sharpness: [0.85, 0.3]),
        HapticProperty(count: 2, interval: [0.0, 0.1], intensity: [0.75, 0.3], sharpness: [0.85, 0.3])]
    
    var body: some View {
        VStack {
            ZStack {
                if showBox {
                    LottieBox()
                        .gesture(
                            DragGesture(minimumDistance: 50)
                                .onEnded { _ in
                                    dragCompleted = true
                                    boxDec = "더블클릭해서 상자안을 봐주세요"
                                })
                    
                }
                
                if dragCompleted && showBox {
                    LottieBoxOpen()
                        .gesture(
                            TapGesture(count: 2)
                                .onEnded { _ in
                                    withAnimation(Animation.easeInOut.delay(1.5)) {
                                        showBox = false
                                        dragCompleted = false
                                        opac = 1
                                        boxDec = ""
                                        showInBox = true
                                        CustomizeHaptic.instance.haptic(hapticCase: Haptic.dynamic, hapticProperty:hapticProperties[0])
                                    }
                                })
                    
                }
                
                if showInBox == true {
                    InBox()
                }
            }
            Text("\(boxDec)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

