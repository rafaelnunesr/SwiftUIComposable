//
//  CarrotSectionView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct CarrotSectionView<ViewModel: CarrotSectionViewProtocol>: SectionView {
    let id = UUID()
    let viewModel: ViewModel
    
    var body: some View {
        SectionCommonView(color: .orange, title: "Carrot Section View", contentValue: "🥕")
    }
    
    func refresh() {
        viewModel.refresh()
    }
}

#Preview {
    let router = CarrotRouter()
    let interactor = CarrotInteractor(id: "id")
    let viewModel = CarrotSectionViewModel(interactor: interactor, router: router)
    CarrotSectionView(viewModel: viewModel)
}
