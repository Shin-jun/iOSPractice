//
//  CircleRadioGradient.swift
//  GuessTheFlag
//
//  Created by Shin yongjun on 2022/06/23.
//

import SwiftUI

struct CircleRadioGradient: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        }
        .ignoresSafeArea()
    }
        
}

struct CircleRadioGradient_Previews: PreviewProvider {
    static var previews: some View {
        CircleRadioGradient()
    }
}
