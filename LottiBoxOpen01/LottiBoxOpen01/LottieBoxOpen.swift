//
//  LottiView.swift
//  LottiBoxOpen01
//
//  Created by Shin yongjun on 2022/06/10.
//

//
// LottieView.swift
// animationTest
//
// Created by leejunmo on 2022/06/08.
//

import SwiftUI
import Lottie

struct LottieBoxOpen: UIViewRepresentable {
    var name = "openBox"
    var loopMode: LottieLoopMode = .playOnce
    
    func makeUIView(context: UIViewRepresentableContext<LottieBoxOpen>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
