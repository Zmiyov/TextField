//
//  HomeSwiftUIView.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 09.08.2024.
//

import SwiftUI

struct HomeSwiftUIView: View {
    enum Field {
        case pin
        case phone
    }
    @FocusState private var focusedField: Field?
    
    @State var pinText: String = ""
    @State var isPinValid: TextFieldState = .base
    
    @State var phoneText: String = ""
    @State var isPhoneValid: TextFieldState = .base
    
    var body: some View {
        
        VStack {
            TextFieldComponentSwiftUIView(name: "Pin*", helper: "Enter pin", errorHelper: "Enter valid pin", maxSymbolsCount: 9, text: $pinText, isValid: $isPinValid)
                .focused($focusedField, equals: .pin)
                .onChange(of: pinText, perform: { newValue in
                    applyMask(text: &pinText, newValue: newValue, count: 9, pattern: "####-####")
                })
                .onChange(of: focusedField) { newField in
                    if newField != .pin {
                        isPinValid = checkPin() ? .wrong : (pinText != "" ? .active : .base)
                    } else {
                        isPinValid = .active
                    }
                }
            
            TextFieldComponentSwiftUIView(name: "Phone", helper: "Enter phone", errorHelper: "Enter valid phone", maxSymbolsCount: 17, text: $phoneText, isValid: $isPhoneValid)
                .focused($focusedField, equals: .phone)
                .onChange(of: phoneText, perform: { newValue in
                    applyMask(text: &phoneText, newValue: newValue, count: 17, pattern: "+### ## ### ## ##")
                })
                .onChange(of: focusedField) { newField in
                    if newField != .phone {
                        isPhoneValid = phoneText != "" ? .active : .base
                    } else {
                        isPhoneValid = .active
                    }
                }
            
            Button(action: {
                checkAllFields()
            }, label: {
                Text("Verify")
            })
        }
    }
    
    private func applyMask(text: inout String, newValue: String, count: Int, pattern: String) {
        if newValue.count > count {
            text = String(newValue.prefix(count))
        } else {
            text = newValue.applyPatternOnNumbers(pattern: pattern, replacementCharacter: "#")
        }
    }
    
    private func checkPin() -> Bool {
        return pinText.count < 9
    }
    
    private func checkPhone() -> Bool {
        return !pinText.isEmpty && pinText.count < 17
    }
    
    private func checkAllFields() {
        
    }
}

#Preview {
    HomeSwiftUIView()
}
