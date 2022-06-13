//
//  ContentView.swift
//  DragAndDrop01
//
//  Created by Shin yongjun on 2022/06/09.
//
// https://stackoverflow.com/questions/66835559/swiftui-how-to-get-notified-when-dragging-and-releasing-on-an-view
//
import SwiftUI

struct ContentView: View {
    
    typealias OffsetType = (offset: CGSize, lastOffset: CGSize)
    
    @State private var objects: [OffsetType] = [
        (offset: CGSize(width: -40, height: 0.0),
         lastOffset: CGSize(width: -40, height: 0.0)),
                                                
        (offset: CGSize(width: 40, height: 0.0),
         lastOffset: CGSize(width: 40, height: 0.0)),
        
        (offset: CGSize(width: 0.0, height: -200),
         lastOffset: CGSize(width: 0.0, height: -200)),
        
        (offset: CGSize(width: 0.0, height: 200),
         lastOffset: CGSize(width: 0.0, height: 200))
        
        
            
            
    ]
    
    var body: some View {
        
        ZStack {
            
            CircleView(color: Color.blue)
                .offset(objects[0].offset)
                .gesture(dragGesture(indexOfObject: 0))
            
            CircleView(color: Color.green)
                .offset(objects[1].offset)
                .gesture(dragGesture(indexOfObject: 1))
            
            CircleView(color: Color.black)
                .offset(objects[2].offset)
                .gesture(dragGesture(indexOfObject: 2))
            
            CircleView(color: Color.gray)
                .offset(objects[3].offset)
                .gesture(dragGesture(indexOfObject: 3))
            
        }
        .animation(Animation.easeInOut(duration: 0.1))
        
    }
    
    func dragGesture(indexOfObject: Int) -> some Gesture {
        
        DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
            .onChanged() { value in
                
                objects[indexOfObject].offset =
                CGSize(width: objects[indexOfObject].lastOffset.width + value.translation.width,
                       height: objects[indexOfObject].lastOffset.height + value.translation.height)
                
            }
            .onEnded() { value in
                
                objects[indexOfObject].lastOffset =
                CGSize(width: objects[indexOfObject].lastOffset.width + value.translation.width,
                       height: objects[indexOfObject].lastOffset.height + value.translation.height)
                
                objects[indexOfObject].offset = objects[indexOfObject].lastOffset
                
                distance()
                
            }
        
    }
    
    func distance() {
        let firstJob = pow(pow((objects[0].offset.width - objects[2].offset.width), 2.0) + pow((objects[0].offset.height - objects[2].offset.height), 2.0), 0.5) <= 100
        let secondJob = pow(pow((objects[1].offset.width - objects[3].offset.width), 2.0) + pow((objects[1].offset.height - objects[3].offset.height), 2.0), 0.5) <= 100
        if  firstJob == true && secondJob == true
        { print("same place!") }

    }
    
}
