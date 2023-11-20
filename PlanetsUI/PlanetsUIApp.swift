//
//  PlanetsUIApp.swift
//  SFSymbol
//
//  Created by Sanjeev Bharti on 11/17/23.
//

import SwiftUI

@main
struct PlanetsUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                FirstView()
                SecondView()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .gray
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
            }
        }
    }
}
