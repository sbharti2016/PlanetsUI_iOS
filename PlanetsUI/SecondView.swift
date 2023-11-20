//
//  SecondView.swift
//  SFSymbol
//
//  Created by Sanjeev Bharti on 11/17/23.
//

import SwiftUI

struct SecondView: View {
    
    @State var startRotation = false
    @State var xAxisRotationValue = 0.0

    var body: some View {
        
        ZStack {
            planetView
            stepperView
        }
        .onAppear() {
            if startRotation == false {
                startRotation.toggle()
            }
        }
    }
    
    private var planetView: some View {
        ZStack {
            sunView
            ForEach(Planet.allCases, id: \.self) { planet in
                drawPlanetViewWith(diameter: planet.diameter, color: planet.color, speed: planet.speed)
            }
        }
        .rotation3DEffect(
            .degrees(startRotation ? xAxisRotationValue : 0), axis: (x: 1.0, y: 1.0, z: 0.0)
        )
        .animation(.smooth, value: xAxisRotationValue)
    }
    
    private var sunView: some View {
        Circle()
            .fill(.orange)
            .frame(height: 75.0)
            .scaleEffect(startRotation ? 1.3 : 1.0)
            .blur(radius:startRotation ? 5.0 : 1.0)
            .animation(.easeIn(duration: 10.0).repeatForever(autoreverses: true), value: startRotation)
    }
    
    private func drawPlanetViewWith(diameter: CGFloat, color: Color, speed: Double) -> some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 2.0)
                .stroke(.gray, style: .init(lineWidth: 1, dash: [0.5,3]), antialiased: false)
                .frame(height: diameter)
            
            Circle()
                .fill(color)
                .frame(height: 30)
                .offset(y: -diameter/2)
                .rotationEffect(.degrees(startRotation ? 0 : 360))
                .animation(.linear(duration: TimeInterval(speed)).repeatForever(autoreverses: false), value: startRotation)

        }
    }
    
    private var stepperView: some View {
        VStack {
            HStack {
                Spacer()
                stepper
            }
            Spacer()
        }
        .padding()
    }
    
    private var stepper: some View {
        HStack {
            Button(action: {
                if xAxisRotationValue <= 0 {return}
                xAxisRotationValue -= 10
            }, label: {
                Text("-").bold().padding(3)
                    .bold()
                    .background(Color.red)
            })
            
            Text("`Rotation`")
           
            Button(action: {
                if xAxisRotationValue >= 60 {return}
                xAxisRotationValue += 10
            }, label: {
                Text("+").bold().padding(3)
                    .background(Color.green)
            })
        }
        .frame(width: 150)
        
    }
}

#Preview {
    SecondView()
}
