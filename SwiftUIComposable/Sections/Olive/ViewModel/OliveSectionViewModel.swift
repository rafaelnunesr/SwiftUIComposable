//
//  OliveViewModel.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

protocol OliveSectionViewProtocol: SectionViewModelRefreshable {}

class OliveSectionViewModel: OliveSectionViewProtocol {
    init(interactor: OliveInteractor, router: OliveRouterProtocol) {}
    
    func refresh() {
        print("Olive Section refresh called")
    }
}
