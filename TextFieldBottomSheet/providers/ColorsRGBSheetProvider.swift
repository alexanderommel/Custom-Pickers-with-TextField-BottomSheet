//
//  ColorsRGBSheetProvider.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import SwiftUI



public struct ColorsSheetProvider: View, SheetContentProvider {
    

    public var value: Binding<SheetSelectedItem<Int>>
    public var isVisible: Binding<Bool>
        
    public var body: some View {
        VStack(alignment: .center){
            
            HStack{
                Button{
                    value.wrappedValue.item = 1
                    value.wrappedValue.description = "Beautiful yellow color"
                    isVisible.wrappedValue.toggle()
                } label: {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 36, height: 36)
                }
                Button{
                    value.wrappedValue.item = 2
                    value.wrappedValue.description = "Beautiful blue color"
                    isVisible.wrappedValue.toggle()
                } label: {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 36, height: 36)
                }
                Button{
                    value.wrappedValue.item = 3
                    value.wrappedValue.description = "Beautiful red color"
                    isVisible.wrappedValue.toggle()
                } label: {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 36, height: 36)
                }
            }
            
           
        }
    }
    
    public init(value: Binding<SheetSelectedItem<Int>>,
                isVisible: Binding<Bool>) {
        self.value = value
        self.isVisible = isVisible
    }
}
