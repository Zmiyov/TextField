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
        case check
    }
    @FocusState private var focusedField: Field?
    
    @State var pinText: String = ""
    @State var isPinValid: TextFieldState = .base
    
    @State var phoneText: String = ""
    @State var isPhoneValid: TextFieldState = .base
    
    var body: some View {
        
        TextFormView { validate in
            VStack {
                TextFieldComponentSwiftUIView(name: "Pin*", helper: "Enter pin", errorHelper: "Enter valid pin", maxSymbolsCount: 9, text: $pinText, isValid: $isPinValid)
                    .validate({
                        checkPin()
                    })
                    .focused($focusedField, equals: .pin)
                    .onChange(of: pinText, perform: { newValue in
                        applyMask(text: &pinText, newValue: newValue, count: 9, pattern: "####-####")
                    })
                    .onChange(of: focusedField) { newField in
                        if newField == .pin {
                            isPinValid = .active
                        } else {
//                            isPinValid = checkPin() ? .active : (pinText != "" ? .wrong : .base)
                            isPinValid = checkPin() ? .active : .wrong
                        }
                    }
                
                TextFieldComponentSwiftUIView(name: "Phone", helper: "Enter phone", errorHelper: "Enter valid phone", maxSymbolsCount: 17, text: $phoneText, isValid: $isPhoneValid)
                    .validate({
                        checkPhone()
                    })
                    .focused($focusedField, equals: .phone)
                    .onChange(of: phoneText, perform: { newValue in
                        applyMask(text: &phoneText, newValue: newValue, count: 17, pattern: "+### ## ### ## ##")
                    })
                    .onChange(of: focusedField) { newField in
                        if newField == .phone {
                            isPhoneValid = .active
                        } else {
                            isPhoneValid = checkPhone() ? .active : .wrong
                        }
                    }
                
             
                
                Button(action: {
                    focusedField = nil
                    if !validate() {
                        print("Not validated")
                        return
                    } else {
                        print("Validated")
                    }
                }, label: {
                    Text("Verify")
                })
            }
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
//        let result = pinText.count == 9
//        if !result {
//            isPinValid = .wrong
//        } else {
//            
//        }
        return pinText.count == 9
    }
    
    private func checkPhone() -> Bool {
        return phoneText.count == 17
    }

}

#Preview {
    HomeSwiftUIView()
}
