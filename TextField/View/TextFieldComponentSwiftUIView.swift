//
//  TextFieldComponentSwiftUIView.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 09.08.2024.
//

import SwiftUI

struct TextFieldComponentSwiftUIView: View {
    var name: String
    var helper: String
    var errorHelper: String
    var maxSymbolsCount: Int
    
    @Binding var text: String
    @Binding var isValid: TextFieldState
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .padding(4)
                .background(.white)
                .foregroundStyle(isValid == .wrong ? .red : .gray)
                .offset(x: 15, y: 20)
                .zIndex(1.0)
                .opacity((isValid == .active || isValid == .wrong || !text.isEmpty) ? 1 : 0)
            
            TextField(name, text: $text)
                .focused($textFieldIsFocused)
                .padding()
                .keyboardType(.numberPad)
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(style: StrokeStyle())
                    .foregroundStyle(isValid == .wrong ? .red : .gray)
                )
 
            HStack {
                Text(isValid == .wrong ? errorHelper : helper)
                    .foregroundStyle(isValid == .wrong ? .red : .gray)
                Spacer()
                Text("\(text.count)/\(maxSymbolsCount)")
                    .foregroundStyle(isValid == .wrong ? .red : .gray)
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.white)
    }
}

#Preview {
    TextFieldComponentSwiftUIView(name: "",helper: "", errorHelper: "", maxSymbolsCount: 9, text: .constant(""), isValid: .constant(.base))
}
