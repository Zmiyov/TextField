//
//  ContentView.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 09.08.2024.
//

import SwiftUI
import SwiftUIIntrospect

enum TextFieldState {
    case base
    case active
    case wrong
}

struct ContentView: View {
    
    var body: some View {
        HomeSwiftUIView()
    }
    
}

#Preview {
    ContentView()
}
