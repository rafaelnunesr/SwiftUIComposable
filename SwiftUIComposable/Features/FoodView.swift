//
//  FoodView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 23/12/25.
//

import SwiftUI

protocol FoodViewModelProtocol {}

class FoodViewModel: FoodViewModelProtocol {}

struct FoodView<ViewModel: FoodViewModelProtocol>: View {
    let viewModel: ViewModel
    let sectionGroup: SectionGroupView?
    
    var body: some View {
        ScrollView {
            headerView
            
            if let sectionGroup {
                sectionGroup
            }
        }
        .refreshable {
            if let sectionGroup {
                sectionGroup.refresh()
            }
        }
        .navigationTitle("Food View")
    }
    
    private var headerView: some View {
        Rectangle()
            .frame(height: 100)
            .foregroundStyle(Color.brown.opacity(0.3))
    }
}

#Preview {
    struct SectionViewTest: View, SectionView {        
        var id = UUID()
        
        var body: some View {
            SectionCommonView(color: .red, title: "Section View Test", contentValue: "🍎")
        }
        
        func refresh() {
            print("refresh called")
        }
    }
    
    let viewModel = FoodViewModel()
    
    return FoodView(
        viewModel: viewModel,
        sectionGroup: SectionGroupView(
            sections: [SectionViewTest()]
        )
    )
}
