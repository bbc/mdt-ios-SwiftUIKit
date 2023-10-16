//
//  CornerButtonPreview.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 16/10/2023.
//

import SwiftUI

struct CornerButtonPreview: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .cornerRadius(10)
            .shadow(color: .primary.opacity(0.6), radius: 2)
            .overlayCornerButton(role: .delete) {
                print("delete button tapped")
            }
            .overlayCornerButton(role: .edit) {
                print("edit button tapped")
            }
    }
}

#Preview {
    CornerButtonPreview(image: Image(systemName: "square.dashed.inset.filled"))
}
