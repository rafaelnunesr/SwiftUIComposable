//
//  HomeView.swift
//  SwiftUIComposable
//
//  Created by Rafael Rios on 18/12/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var navigator: Navigator
    @StateObject private var router: Router
    
    init(navigator: Navigator) {
        _navigator = StateObject(wrappedValue: navigator)
        let router = Router(navigator: navigator)
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            VStack(spacing: 16) {
                Button("Go Fruits view") {
                    navigator.navigate(to: Destination.fruits)
                }
                
                Button("Go to Foods View") {
                    navigator.navigate(to: Destination.food)
                }
            }
            .navigationTitle("Home View")
            .navigationDestination(for: Destination.self) { destination in
                router.build(route: destination)
            }
        }
    }
}

#Preview {
    let navigator = Navigator()

    HomeView(navigator: navigator)
}
