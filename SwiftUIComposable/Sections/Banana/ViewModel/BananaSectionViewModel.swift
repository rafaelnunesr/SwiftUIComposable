//
//  BananaSectionViewModel.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

protocol BananaSectionViewProtocol: SectionViewModelRefreshable {}

class BananaSectionViewModel: BananaSectionViewProtocol {
    init(interactor: BananaInteractor, router: BananaRouterProtocol) {}
    
    func refresh() {
        print("Banana Section refresh called")
    }
}
