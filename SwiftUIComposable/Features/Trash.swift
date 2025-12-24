//
//  FruitsView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//
//
//import SwiftUI
//
//protocol FruitsViewModelProtocol {}
//
//class FruitsViewModel: FruitsViewModelProtocol {}
//
//struct FruitsView<ViewModel: FruitsViewModelProtocol, Section: SectionView>: View {
//    let viewModel: ViewModel
//    let sectionGroup: SectionGroupView<Section>?
//
//    var body: some View {
//        ScrollView {
//            if let sectionGroup {
//                sectionGroup
//            }
//        }
//        .refreshable {
//            if let sectionGroup {
//                sectionGroup.refresh()
//            }
//        }
//        .navigationTitle("Fruits View")
//    }
//}
//
//#Preview {
//    struct SectionViewTest: View, SectionView {
//        let id = UUID()
//        
//        var body: some View {
//            SectionCommonView(color: .red, title: "Section View Test", contentValue: "🍎")
//        }
//        
//        func refresh() {
//            print("refresh called")
//        }
//    }
//    
//    let viewModel = FruitsViewModel()
//    
//    return FruitsView(
//        viewModel: viewModel,
//        sectionGroup: SectionGroupView(
//            sections: [SectionViewTest()]
//        )
//    )
//}
//
//struct SectionGroupView<Section: SectionView>: View {
//    let sections: [Section]
//
//    var body: some View {
//        ForEach(sections) { section in
//            section.body
//        }
//    }
//
//    func refresh() {
//        for section in sections {
//            section.refresh()
//        }
//    }
//}
//
//protocol SectionView: Identifiable {
//    associatedtype Body : View
//    @ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
//    func refresh()
//}







//
//import SwiftUI
//
//struct AppleSectionViewTest: View, SectionView {
//    let id = UUID()
//    let viewModel: ViewModel
//
//    var body: some View {
//        SectionCommonView(color: .red, title: "Apple Section View", contentValue: "🍎")
//    }
//}
//
//protocol FruitsViewModelProtocol {}
//class FruitsViewModel: FruitsViewModelProtocol {}
//
//struct FruitsView<ViewModel: FruitsViewModelProtocol, Section: SectionView>: View {
//    let viewModel: ViewModel
//    let sectionGroup: SectionGroupView<Section>?
//
//    var body: some View {
//        ScrollView {
//            if let sectionGroup {
//                sectionGroup
//            }
//        }
//        .refreshable {
//            if let sectionGroup {
//                sectionGroup.refresh()
//            }
//        }
//        .navigationTitle("Fruits View")
//    }
//}
//
//#Preview {
//    let viewModel = FruitsViewModel()
//    FruitsView(viewModel: viewModel, sectionGroup: nil)
//}
//
//struct SectionGroupView<Section: SectionView>: View {
//    let sections: [Section]
//
//    var body: some View {
//        ForEach(sections) { section in
//            section.view()
//        }
//    }
//
//    func refresh() {
//        for section in sections {
//            section.refresh()
//        }
//    }
//}
//
//protocol SectionView: Identifiable {
//    associatedtype Content: View
//    @ViewBuilder func view() -> Content
//    func refresh()
//}












//import SwiftUI
//
//protocol FruitsViewModelProtocol {}
//
//class FruitsViewModel: FruitsViewModelProtocol {}
//
//protocol ContentSectionView: GenericSectionViewProtocol {}
//
//struct FruitsView<ViewModel: FruitsViewModelProtocol>: View {
//    let viewModel: ViewModel
//    let sectionGroup: SectionGroupView?
//
//    var body: some View {
//        ScrollView {
//            sectionGroup?.contentView
//        }
//        .refreshable {
//            sectionGroup?.refresh()
//        }
//        .navigationTitle("Fruits View")
//    }
//}
//
//#Preview {
//    let viewModel = FruitsViewModel()
//    FruitsView(viewModel: viewModel, sectionGroup: nil)
//}
//
//struct SectionGroupView: Equatable, RandomAccessCollection, Sendable, ObservableObject {
//    var sections: [any GenericSectionViewProtocol]
//
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        guard lhs.sections.count == rhs.sections.count else {
//            return false
//        }
//
//        return false // review this
//    }
//
//    var contentView: some View {
//        ForEach(sections) { view in
//            view
//        }
//    }
//
//    func refresh() {
//        sections.forEach { $0.refresh() }
//    }
//}
//
//protocol GenericSectionViewProtocol: View, Identifiable {
//    var id: Int { get }
//    func refresh()
//}
