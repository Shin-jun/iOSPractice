//
//  CheckAmount.swift
//  SwiftUIWebSplit
//
//  Created by Shin yongjun on 2022/06/14.
//

import SwiftUI

struct CheckAmount: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
            }
        }
    }
}

struct CheckAmount_Previews: PreviewProvider {
    static var previews: some View {
        CheckAmount()
    }
}
