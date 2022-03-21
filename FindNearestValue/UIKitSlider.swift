//
//  UIKitSlider.swift
//  FindNearestValue
//
//  Created by Андрей Евдокимов on 21.03.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    @Binding var currentValue: Float
    
    let alpha: CGFloat
    let color: UIColor

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        // uiView.thumbTintColor = .red.withAlphaComponent(alphaChange())
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
//    private func alphaChange() -> CGFloat {
//        let newColor = 100 - abs(targetValue - lroundf(currentValue * 100))
//        return CGFloat(Float(newColor) / 100)
//    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func changeValue(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(0.5), alpha: 0.5, color: .red)
    }
}
