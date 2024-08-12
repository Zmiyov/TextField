//
//  TextFormView.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 11.08.2024.
//

import SwiftUI

struct TextFormView<Content: View>: View {
    @State var validationSeeds: [Bool] = []
    @ViewBuilder var content: ((@escaping () -> Bool)) -> Content
    var body: some View {
        content(validate)
            .onPreferenceChange(ValidationPreferenceKey.self, perform: { value in
                validationSeeds = value
            })
    }
    
    private func validate() -> Bool {
        for seed in validationSeeds {
            if !seed { return false }
        }
        return true
    }
}
