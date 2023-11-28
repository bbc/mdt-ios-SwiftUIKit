//
//  PresentBannerManager.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 28/11/2023.
//

import Foundation

struct DemoBanner: Equatable {
    let title: String
    let message: String
}

final class PresentBannerManager: ObservableObject {
    @Published var isPresented: Bool = false
    
    var banner: DemoBanner? {
        didSet {
            isPresented = banner != nil
        }
    }
    
    public func dismiss() {
        if isPresented {
            isPresented = false
        }
    }
}
