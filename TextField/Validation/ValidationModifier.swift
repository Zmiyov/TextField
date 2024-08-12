//
//  ValidationModifier.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 11.08.2024.
//

import SwiftUI

struct ValidationModifier: ViewModifier {
    let validation: () -> Bool
    
    func body(content: Content) -> some View {
        content
            .preference(
                key: ValidationPreferenceKey.self,
                value: [validation()]
            )
    }
}
