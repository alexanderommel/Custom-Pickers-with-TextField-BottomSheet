//
//  TextFieldBottomSheetView.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import SwiftUI

public struct TextFieldBottomSheetView<Content: View & SheetContentProvider, T >: View {
    
    
    @Binding var item: SheetSelectedItem<T>
    @Binding var visible: Bool
    var title: String
    let content: Content
    
    @State private var sheetHeight: CGFloat = .zero
        
    public var body: some View {
                
        Button(action: {
            visible.toggle()
        }) {
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Group {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.description)
                                .font(.caption)
                                .fontWeight(.semibold)
                            .padding(.leading, 8)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                    }.padding(.horizontal, 18)
                    .padding(.vertical, 20)
                }.background(Color(hue: 1.0, saturation: 0.0, brightness: 0.907))
                    .cornerRadius(14.0)
                
            }
        }
        .foregroundStyle(.black)
        .sheet(isPresented: $visible,
               onDismiss: nil
        ){
            VStack{
                content
            }
            .padding(.top, 32)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .fixedSize(horizontal: false, vertical: true)
            .modifier(HeightModifier(height: $sheetHeight))
            .presentationDetents([.height(sheetHeight)])
            .presentationDragIndicator(.visible)
        }
        .buttonStyle(.borderless)
        
    }

    public init(visible: Binding<Bool>,
                item: Binding<SheetSelectedItem<T>>,
                title: String,
                @ViewBuilder content: () -> Content){
        self._item = item
        self._visible = visible
        self.title = title
        self.content = content()
    }
    
}

#Preview {
    
    let items = [
        SheetSelectedItem<Int>(description: "Number 500", item: 500, id: 1),
        SheetSelectedItem<Int>(description: "Number 222", item: 222, id: 2),
    ]
    @State var myContent = SheetSelectedItem<Int>(description: "Number 0",item: 0, id: 0)
    @State var visible = false
    
    return TextFieldBottomSheetView<CustomListSheetProvider<Int>,Int>(
        visible: $visible,
        item: $myContent,
        title: "Numbers list picker",
        content: {
            CustomListSheetProvider<Int>(value: $myContent, isVisible: $visible, items: items)
        }
    )
}
