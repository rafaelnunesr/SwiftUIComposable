//
//  CarrotViewModel.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

protocol CarrotSectionViewProtocol: SectionViewModelRefreshable {}

class CarrotSectionViewModel: CarrotSectionViewProtocol {
    init(interactor: CarrotInteractor, router: CarrotRouterProtocol) {}
    
    func refresh() {
        print("Carrot Section refresh called")
    }
}
