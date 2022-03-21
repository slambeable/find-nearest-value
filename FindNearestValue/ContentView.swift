//
//  ContentView.swift
//  FindNearestValue
//
//  Created by Андрей Евдокимов on 19.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue: Float = 0.5
    @State var targetValue = Int.random(in: 0...100)

    @State private var showingAlert = false
    
    private var computeScore: Int {
        let difference = abs(targetValue - lroundf(currentValue * 100))
        return 100 - difference
    }

    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .font(.system(size: 14))
                .padding(.bottom, 16)
            HStack {
                Text("0")
                UIKitSlider(
                    currentValue: $currentValue,
                    alpha: CGFloat(Float(computeScore) / 100),
                    color: .red
                )
                Text("100")
            }
            .padding(.bottom, 26)
            Button("Проверь меня!") {
                showingAlert = true
            }
            .padding(.bottom, 26)
            .alert("You score",
                isPresented: $showingAlert,
                actions: {
                    Button("Ok") {}
                }, message: {
                    Text("\(computeScore)")
                }
            )
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
