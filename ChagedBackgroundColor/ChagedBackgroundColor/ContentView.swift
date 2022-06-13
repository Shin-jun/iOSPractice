//
//  ContentView.swift
//  ChagedBackgroundColor
//
//  Created by Shin yongjun on 2022/06/11.
//

import SwiftUI

struct ContentView: View {
        
        @State private var showMenu: Bool = false
        
        var body: some View {
            ZStack {
                
                // The Main View.
                Text("Tap Me!")
                    .padding()
                    .onTapGesture {
                        showMenu.toggle()
                        print("Tapped Main View")
                    }
                
                // The Menu View (shown on top of the Main View).
                if showMenu {
                    GeometryReader { _ in
                        Text("Menu")
                            .padding()
                            .onTapGesture {
                                // do something here
                                print("Tapped Menu")
                            }
                    }
                    
                    // The Background View that darkens the whole screen.
                    .background(
                        Color.gray.opacity(0.2)
                            .edgesIgnoringSafeArea(.all)
                    )
                    .onTapGesture {
                        showMenu.toggle()
                        print("Tapped Background")
                    }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
