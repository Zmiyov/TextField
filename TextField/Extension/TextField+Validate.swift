//
//  TextField+Validate.swift
//  TextField
//
//  Created by Volodymyr Pysarenko on 11.08.2024.
//

import SwiftUI

extension TextField {
    func validate(_ flag: @escaping () -> Bool) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}
