//
//  SectionGroupView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 23/12/25.
//

import SwiftUI

protocol SectionViewModelRefreshable {
    func refresh()
}

protocol SectionView: View, Identifiable {
    var id: UUID { get }
    func refresh()
}

struct SectionGroupView: View {
    let sections: [any SectionView]
    
    var body: some View {
        ForEach(sections, id: \.id) { section in
            AnyView(section)
        }
    }
    
    func refresh() {
        for section in sections {
            section.refresh()
        }
    }
}
