//
//  BannerParentViewModel.swift
//  SwiftUIKit
//
//  Created by Maria Kharybina on 17/10/2023.
//

import Foundation

class BannerParentViewModel: ObservableObject {
    @Published var childViewModel = BannerChildViewModel()
}
