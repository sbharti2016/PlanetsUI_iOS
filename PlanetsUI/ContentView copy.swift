//
//  ContentView.swift
//  SFSymbol
//
//  Created by Sanjeev Bharti on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var startRotation = false
    
    var body: some View {
        ZStack {
            
            drawViewWith(height: 800, animationSpeed: 50)
            drawViewWith(height: 700, animationSpeed: 45)
            drawViewWith(height: 600, color: .blue, animationSpeed: 40)
            drawViewWith(height: 500, color: .white, animationSpeed: 35)
            drawViewWith(height: 400, color: .brown, animationSpeed: 30)
            drawViewWith(height: 300, color: .orange.opacity(0.6), animationSpeed: 25)
            drawViewWith(height: 220, animationSpeed: 20)
            drawViewWith(height: 150, color: .orange.opacity(0.8), animationSpeed: 15)
            sun
        }
        .rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: 0))

        .onAppear() {
            startRotation.toggle()
        }
        .padding()
    }
    
    
    var sun: some View {
        Circle()
            .fill(.orange)
            .frame(height: 75.0)
            .scaleEffect(startRotation ? 1.2 : 1.0)
            .blur(radius:startRotation ? 5.0 : 1.0)
            .animation(.easeIn(duration: 10.0).repeatForever(autoreverses: true), value: startRotation)
    }
    
    func drawViewWith(height: CGFloat, color: Color = .blue, animationSpeed: Double = 5.0) -> some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 2.0)
                .stroke(.gray, style: .init(lineWidth: 1, dash: [0.5,3]), antialiased: false)
                .frame(height: height)
            
            Circle()
                .fill(color)
                .frame(height: 30)
                .offset(y: -height/2)
                .rotationEffect(.degrees(startRotation ? 0 : 360))
                .animation(.linear(duration: TimeInterval(animationSpeed)).repeatForever(autoreverses: false), value: startRotation)
        }
    }
    
}

enum Planet: CaseIterable {
    
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    
    var name: String {
        switch self {
        case .mercury: return "Mercury"
        case .venus: return "Venus"
        case .earth: return "Earth"
        case .mars: return "Mars"
        case .jupiter: return "Jupiter"
        case .saturn: return "Saturn"
        case .uranus: return "Uranus"
        case .neptune: return "Neptune"
        }
    }
    
    var imageName: String {
        switch self {
        case .mercury: return "Mercury"
        case .venus: return "Venus"
        case .earth: return "Earth"
        case .mars: return "Mars"
        case .jupiter: return "Jupiter"
        case .saturn: return "Saturn"
        case .uranus: return "Uranus"
        case .neptune: return "Neptune"
        }
    }
    
    var color: Color {
        switch self {
        case .mercury: return Color.white
        case .venus: return Color.white
        case .earth: return Color.white
        case .mars: return Color.white
        case .jupiter: return Color.white
        case .saturn: return Color.white
        case .uranus: return Color.white
        case .neptune: return Color.white
        }
    }
    
    var view: some View {
        return EmptyView()
    }
    

    func drawViewWith(height: CGFloat, color: Color = .blue, animationSpeed: Double = 5.0) -> some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 2.0)
                .stroke(.gray, style: .init(lineWidth: 1, dash: [0.5,3]), antialiased: false)
                .frame(height: height)
            
            Circle()
                .fill(color)
                .frame(height: 30)
                .offset(y: -height/2)
                .rotationEffect(.degrees(startRotation ? 0 : 360))
                .animation(.linear(duration: TimeInterval(animationSpeed)).repeatForever(autoreverses: false), value: startRotation)
        }
    }
    
}



#Preview {
    ContentView()
}
