//
//  Coordinator.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 23/12/25.
//

import Combine
import SwiftUI

enum Destination: Hashable {
    case fruits
    case food
}

class Router: ObservableObject {
    private var navigator: Navigator
    
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    @ViewBuilder
    func build(route: Destination) -> some View {
        switch route {
        case .fruits:
            buildFruitsView()
        case .food:
            buildFoodView()
        }
    }
    
    private func buildFruitsView() -> some View {
        let appleSection = buildAppleSection()
        let bananaSection = buildBananaSection()
        
        let sectionGroupView = SectionGroupView(sections: [appleSection, bananaSection])
        
        let viewModel = FruitsViewModel()
        return FruitsView(viewModel: viewModel, sectionGroup: sectionGroupView)
    }
    
    private func buildFoodView() -> some View {
        let appleSection = buildAppleSection()
        let bananaSection = buildBananaSection()
        
        let oliveSection = buildOliveSection()
        let carrotSection = buildCarrotSection()
        
        let sectionGroupView = SectionGroupView(sections: [appleSection, bananaSection, oliveSection, carrotSection])
        
        let viewModel = FoodViewModel()
        return FoodView(viewModel: viewModel, sectionGroup: sectionGroupView)
    }
}

extension Router {
    fileprivate func buildAppleSection() -> some SectionView {
        let router = AppleRouter()
        let interactor = AppleInteractor(id: "apple_id")
        let viewModel = AppleSectionViewModel(interactor: interactor, router: router)
        return AppleSectionView(viewModel: viewModel)
    }
    
    fileprivate func buildBananaSection() -> some SectionView {
        let router = BananaRouter()
        let interactor = BananaInteractor(id: "banana_id")
        let viewModel = BananaSectionViewModel(interactor: interactor, router: router)
        return BananaSectionView(viewModel: viewModel)
    }
    
    fileprivate func buildOliveSection() -> some SectionView {
        let router = OliveRouter()
        let interactor = OliveInteractor(id: "olive_id")
        let viewModel = OliveSectionViewModel(interactor: interactor, router: router)
        return OliveSectionView(viewModel: viewModel)
    }
    
    fileprivate func buildCarrotSection() -> some SectionView {
        let router = CarrotRouter()
        let interactor = CarrotInteractor(id: "carrot_id")
        let viewModel = CarrotSectionViewModel(interactor: interactor, router: router)
        return CarrotSectionView(viewModel: viewModel)
    }
}
