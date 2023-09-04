//
//  BBCErrorData.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 04/09/2023.
//

import Foundation

struct BBCErrorData {
    var errorTitle: String = ""
    var errorMessage: String = ""
    var standalone: Bool = false
    
    init(errorTitle: String, errorMessage: String, standalone: Bool) {
        self.errorTitle = errorTitle
        self.errorMessage = errorMessage
        self.standalone = standalone
    }
}
