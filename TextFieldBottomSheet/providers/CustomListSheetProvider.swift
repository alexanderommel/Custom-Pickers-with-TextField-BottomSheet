//
//  CustomListSheetProvider.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import SwiftUI

public struct CustomListSheetProvider<T>: View, SheetContentProvider {

    public var value: Binding<SheetSelectedItem<T>>
    public var isVisible: Binding<Bool>
    public var items: [SheetSelectedItem<T>]
        
    public var body: some View {
        VStack(alignment: .leading){
            ForEach(items){ item in
                HStack{
                    Button{
                        value.wrappedValue = item
                        isVisible.wrappedValue.toggle()
                    } label: {
                        HStack{
                            Circle()
                                .strokeBorder(Color.blue,lineWidth: 2.5)
                                .frame(width: 16, height: 16)
                            Text(item.description)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
    public init(value: Binding<SheetSelectedItem<T>>, isVisible: Binding<Bool>,
                items: [SheetSelectedItem<T>]) {
        self.value = value
        self.isVisible = isVisible
        self.items = items
    }
}

#Preview {
    @State var value = SheetSelectedItem<Int>(description: "", item: 10, id: 1)
    @State var isVisible = false
    var ages = [
        SheetSelectedItem<Int>(description: "name1", item: 43, id: 1),
        SheetSelectedItem<Int>(description: "name2", item: 23, id: 2),
        SheetSelectedItem<Int>(description: "name3", item: 44, id: 3)
    ]
    return CustomListSheetProvider<Int>(value: $value, isVisible: $isVisible,
                                   items: ages)
}
