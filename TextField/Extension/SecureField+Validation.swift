//
//  SecureField+Validation.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 11.08.2024.
//

import SwiftUI

extension SecureField {
    func validate(_ flag: @escaping () -> Bool) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}
