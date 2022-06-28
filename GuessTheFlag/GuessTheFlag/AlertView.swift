//
//  AlertView.swift
//  GuessTheFlag
//
//  Created by Shin yongjun on 2022/06/23.
//

import SwiftUI

struct AlertView: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Import message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancle", role: .cancel) { }
        } message: {
            Text("Please read this")
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
