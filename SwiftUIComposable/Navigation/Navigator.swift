//
//  Navigator.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 23/12/25.
//

import SwiftUI
import Combine

class Navigator: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to destination: any Hashable) {
        path.append(destination)
    }
    
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
