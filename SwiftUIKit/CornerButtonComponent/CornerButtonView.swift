//
//  CornerButtonView.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 16/10/2023.
//

import SwiftUI

struct CornerButtonView: View {
    var role: ButtonRole
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: role.symbolName)
                .foregroundColor(Color(uiColor: .systemGray))
                .padding(4)
                .background(role.material,
                            in: Circle())
                .offset(x: role.offset.x, y: role.offset.y)
        }
    }
}
#Preview {
    CornerButtonView(role: .delete) {
        print("button pressed")
    }
}
