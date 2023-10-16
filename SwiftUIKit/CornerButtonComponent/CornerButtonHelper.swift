//
//  CornerButtonHelper.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 16/10/2023.
//

import SwiftUI

enum ButtonModes {
    static let edit = "pencil"
    static let delete = "xmark"
}

enum ButtonRole {
    case edit
    case delete
    
    var symbolName: String {
        switch self {
        case .edit:
            return ButtonModes.edit
        case .delete:
            return ButtonModes.delete
        }
    }
    
    var material: Material {
        switch self {
        case .edit:
            return .thickMaterial
        case .delete:
            return .ultraThinMaterial
        }
    }
    
    var offset: (x: CGFloat, y: CGFloat) {
        switch self {
        case .edit:
            return (x: 1, y: -1)
        case .delete:
            return (x: 10, y: -10)
        }
    }
    
    var aligment: Alignment {
        switch self {
        case .edit:
            return .bottomLeading
        case .delete:
            return .topTrailing
        }
    }
}
