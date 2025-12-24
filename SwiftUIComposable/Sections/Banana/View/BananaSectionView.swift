//
//  BananaSectionView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct BananaSectionView<ViewModel: BananaSectionViewProtocol>: SectionView {
    let id = UUID()
    let viewModel: ViewModel
    
    var body: some View {
        SectionCommonView(color: .yellow, title: "Banana Section View", contentValue: "🍌")
    }
    
    func refresh() {
        viewModel.refresh()
    }
}

#Preview {
    let router = BananaRouter()
    let interactor = BananaInteractor(id: "id")
    let viewModel = BananaSectionViewModel(interactor: interactor, router: router)
    BananaSectionView(viewModel: viewModel)
}
