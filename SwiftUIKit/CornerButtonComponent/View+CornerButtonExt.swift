//
//  View+CornerButtonExt.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 16/10/2023.
//

import SwiftUI

extension View {
    func overlayCornerButton(role: ButtonRole, action: @escaping () -> Void) -> some View {
        modifier(OverlayCornerButtonModifier(role: role, action: action))
    }
}

struct OverlayCornerButtonModifier: ViewModifier {
    var role: ButtonRole
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: role.aligment, content: {
                CornerButtonView(role: role, action: action)
            })
    }
}
