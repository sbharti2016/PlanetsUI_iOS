//
//  FirstView.swift
//  SFSymbol
//
//  Created by Sanjeev Bharti on 11/17/23.
//

import SwiftUI

struct FirstView: View {
    
    @State var startRotation = false
    var body: some View {
        
        ZStack {
            sunView
            ForEach(Planet.allCases, id: \.self) { planet in
                createOrbitAndViewFor(planet)
            }
        }
        .onAppear() {
            if startRotation == false {
                startRotation.toggle()
            }
        }
    }
    
    private var sunView: some View {
        Circle()
            .fill(.orange)
            .frame(height: 75.0)
            .scaleEffect(startRotation ? 1.3 : 1.0)
            .blur(radius:startRotation ? 5.0 : 1.0)
            .animation(.easeIn(duration: 10.0).repeatForever(autoreverses: true), value: startRotation)
    }
    
    private func createOrbitAndViewFor(_ planet: Planet) -> some View {
        
        let radius = planet.diameter/2
        
        return ZStack {
            
            // Orbit
            Circle()
                .stroke(lineWidth: 2.0)
                .stroke(.gray, style: .init(lineWidth: 1, dash: [0.5,3]), antialiased: false)
                .frame(height: planet.diameter)
            
            // Planet
            Circle()
                .fill(planet.color)
                .frame(height: 30)
                .offset(y: -radius)
                .rotationEffect(.degrees(startRotation ? 0 : 360))
                .animation(.linear(duration: TimeInterval(planet.speed)).repeatForever(autoreverses: false), value: startRotation)
        }
    }

}

enum Planet: String, CaseIterable {

    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Neptune"
    
    var index: Int {
        if let index = Planet.allCases.firstIndex(of: self) {
            return index
        }
        return 0
    }
    
    var speed: Double {
        return Double(6 * (index + 1))
    }
    
    var color: Color {
        let colors: [Color] = [.gray, .yellow, .blue, .red, .brown, .orange, Color.blue.opacity(0.5), Color.blue.opacity(0.8)]
        return colors[index]
    }
    
    var diameter: CGFloat {
        if let index = Planet.allCases.firstIndex(of: self) {
            return 200 + Double(100 * index)
        }
        return 0.0
    }
}

#Preview {
    FirstView()
}
