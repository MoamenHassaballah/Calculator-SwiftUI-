//
//  MyCustomCalculatorBtn.swift
//  Calculator
//
//  Created by Moamen Hassaballah on 07/08/2024.
//

import Foundation
import SwiftUI

struct MyCalculatorButton<Content : View> : View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var action: () -> Void
    var foregroundColor: Color
    @ViewBuilder let labelView: Content
    
    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                labelView
            }
        )
        .foregroundStyle(
            foregroundColor
        )
        .padding()
        .frame(
            width: 70,
            height: 70
        )
        .background{
            if colorScheme == .dark {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        Color(uiColor: UIColor(resource: ColorResource.numberButtonBackground))
                    )
                    .shadow(radius:  3)
                
            }
            
        }
    }
}
