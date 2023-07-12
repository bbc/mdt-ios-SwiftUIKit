//
//  String+Ext.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 12/07/2023.
//

import Foundation

extension String {
    
    /// This functions replaces `<html>` in beggining of HTML String with HTML head styling.
    ///
    /// - Requirements: HTML String shouldn't have a `<head>` property.
    /// - Styling includes: default font family and size, as well as support for the dark mode and dynamic font sizes (accessibility feature).
    func addHTMLStyling() -> String {
        let htmlStyling =
                   """
                   <html>
                   <head>
                   <meta name="viewport" content="width=device-width, initial-scale=1">
                   <style type=\"text/css\"> body { font-size: 110%; font-family: 'Helvetica';} :root { color-scheme: light dark; font: -apple-system-body; }</style>
                   </head>
                   """
        let styledContent = self.replacingOccurrences(of: "<html>", with: htmlStyling)
        return styledContent
    }
}
