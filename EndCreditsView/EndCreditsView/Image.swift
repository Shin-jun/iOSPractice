//
//  Image.swift
//  EndCreditsView
//
//  Created by Shin yongjun on 2022/06/15.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "gear")
            .padding(.bottom, 100)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
