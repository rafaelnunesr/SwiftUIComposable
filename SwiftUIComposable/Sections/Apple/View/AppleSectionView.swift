//
//  AppleSectionView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct AppleSectionView<ViewModel: AppleSectionViewProtocol>: SectionView {
    let id = UUID()
    let viewModel: ViewModel
    
    var body: some View {
        let _ = print("AppleSectionView ID: \(id)")
        
        SectionCommonView(color: .red, title: "Apple Section View", contentValue: "🍎")
    }
    
    func refresh() {
        viewModel.refresh()
    }
}

#Preview {
    let router = AppleRouter()
    let interactor = AppleInteractor(id: "id")
    let viewModel = AppleSectionViewModel(interactor: interactor, router: router)
    AppleSectionView(viewModel: viewModel)
}
