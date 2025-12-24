//
//  AppleSectionViewModel.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

protocol AppleSectionViewProtocol: SectionViewModelRefreshable {}

class AppleSectionViewModel: AppleSectionViewProtocol {
    init(interactor: AppleInteractor, router: AppleRouterProtocol) {}
    
    func refresh() {
        print("Apple Section refresh called")
    }
}
