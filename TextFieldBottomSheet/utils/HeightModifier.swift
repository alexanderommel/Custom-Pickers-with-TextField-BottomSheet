//
//  HeightModifier.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import SwiftUI


struct HeightModifier: ViewModifier {
    @Binding var height: CGFloat
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}
