//
//  ContentView6.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Shin yongjun on 2022/10/16.
//

import SwiftUI

struct ContentView6: View {
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false
    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        return VStack {
            Toggle("Agree To terms", isOn: $agreedToTerms)
            Toggle("Agree To privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree To receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree To all", isOn: agreedToAll)
        }
    }
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}
