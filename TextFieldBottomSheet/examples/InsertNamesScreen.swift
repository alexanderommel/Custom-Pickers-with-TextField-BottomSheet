//
//  InsertNamesScreen.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import SwiftUI

struct InsertNamesScreen: View {
    
    @State var names: SheetSelectedItem<Names> = SheetSelectedItem(description: "", item: Names(firstname: "", lastname: ""), id: 0)
    @State var visibleModal: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center){
            Text("Example 2")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            TextFieldBottomSheetView<NamesSheetProvider,Names>(
                visible: $visibleModal,
                item: $names,
                title: "Names",
                content:
                    {
                        NamesSheetProvider(value: $names, isVisible: $visibleModal)
                    }
            ).padding(.top, 6)
            
            if(names.id != 0){
                Text("My last name is: \(names.item.lastname)")
                    .font(.subheadline)
                    .foregroundStyle(.green)
            }
            
        }
        .padding(20)
    }
}

#Preview {
    InsertNamesScreen()
}
