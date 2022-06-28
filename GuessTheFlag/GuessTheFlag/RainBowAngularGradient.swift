//
//  RainBowAngularGradient.swift
//  GuessTheFlag
//
//  Created by Shin yongjun on 2022/06/23.
//

import SwiftUI

struct RainBowAngularGradient: View {
    var body: some View {
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    }
}

struct RainBowAngularGradient_Previews: PreviewProvider {
    static var previews: some View {
        RainBowAngularGradient()
    }
}
