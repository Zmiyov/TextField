//
//  ValidationPreferenceKey.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 11.08.2024.
//

import SwiftUI

struct ValidationPreferenceKey: PreferenceKey {
    static var defaultValue: [Bool] = []
    
    static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
        value += nextValue()
    }
}
