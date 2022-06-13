//
//  FontSize.swift
//  UserDefault01
//
//  Created by Shin yongjun on 2022/06/12.
//

import SwiftUI

struct FontSize: View {
    @AppStorage("fontSize") var fontSize: Double = 18
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            // Title
            HStack{
                Spacer()
                Text("설정")
                    .font(.system(size: 22))
                Spacer()
            }
            
            
            // Text Size Adjust
            Text("텍스트 크기")
                .font(.system(size: 16))

            VStack{
                // Sample Text
                Text("현재 텍스트 크기 입니다.")
                    .font(.system(size: fontSize))
                    .padding(.vertical, 10)
                    .frame(height: 30)
                
                // Slider
                HStack{
                    Text("가")
                        .font(.system(size: 12))
                    Slider(value: $fontSize, in: 12...24,
                           step: 2)
                    Text("가")
                        .font(.system(size: 24))
                }
                .padding(.vertical, 10)
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .cornerRadius(15)
            .offset(y: -10)
    
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct FontSize_Previews: PreviewProvider {
    static var previews: some View {
        FontSize()
    }
}
