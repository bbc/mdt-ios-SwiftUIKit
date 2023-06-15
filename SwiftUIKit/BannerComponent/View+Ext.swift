//
//  View+Ext.swift
//  BBCFeedbackViewController
//
//  Created by Maria Kharybina on 14/06/2023.
//

import SwiftUI

extension View {
    func banner(data: Binding<BannerData>, showBanner: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, showBanner: showBanner))
    }
}
