//
//  OliveSectionView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct OliveSectionView<ViewModel: OliveSectionViewProtocol>: SectionView {
    let id = UUID()
    let viewModel: ViewModel
    
    var body: some View {
        SectionCommonView(color: .green, title: "Olive Section View", contentValue: "🫒")
    }
    
    func refresh() {
        viewModel.refresh()
    }
}

#Preview {
    let router = OliveRouter()
    let interactor = OliveInteractor(id: "id")
    let viewModel = OliveSectionViewModel(interactor: interactor, router: router)
    OliveSectionView(viewModel: viewModel)
}
