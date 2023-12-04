//
//  String+Ext.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 12/07/2023.
//

import Foundation

extension String {
    
    /// This function adds a header with styling between `<html>` and `<body>` in the beggining of HTML String.
    ///
    /// - Requirements: HTML String should have `<html>` and `<body>` properties next to each other.
    /// - Styling includes: default font family and size, as well as support for the dark mode and dynamic font sizes (accessibility feature).
    func addHTMLHeaderWithStyling() -> String {
        let pattern = #"<html>\s*<body>"#
        if let range = self.range(of: pattern, options: .regularExpression) {
            let htmlHeadWithStyle =
                       """
                       <head>
                       <meta name="viewport" content="width=device-width, initial-scale=1">
                       <style type=\"text/css\"> body { font-size: 110%; font-family: 'Helvetica';} :root { color-scheme: light dark; font: -apple-system-body; }</style>
                       </head>
                       """
            return self.replacingCharacters(in: range, with: "<html>\(htmlHeadWithStyle)<body>")
        } else {
            return self
        }
    }
    
}
