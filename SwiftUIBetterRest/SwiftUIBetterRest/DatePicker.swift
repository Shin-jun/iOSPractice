//
//  DatePicker.swift
//  SwiftUIBetterRest
//
//  Created by Shin yongjun on 2022/10/23.
//

import SwiftUI

struct DatePickerExample: View {
    
    @State private var wakeUp = Date.now
    var body: some View {
        HStack{
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            DatePicker("Please enter a time", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExample()
    }
}
