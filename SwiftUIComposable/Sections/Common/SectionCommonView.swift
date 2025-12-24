//
//  SectionCommonView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct SectionCommonView: View {
    let color: Color
    let title: String
    let contentValue: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            dividerView
            
            Group {
                titleLabel
                contentView
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 32)
        .background(color.opacity(0.1))
    }
    
    private var dividerView: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(color)
    }
    
    private var titleLabel: some View {
        Text(title)
            .foregroundStyle(color)
            .colorMultiply(.gray.opacity(1))
            .bold()
    }
    
    private var contentView: some View {
        Text(String(repeating: contentValue, count: 5))
            .font(.largeTitle)
    }
}
