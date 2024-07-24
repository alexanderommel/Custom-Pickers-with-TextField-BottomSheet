//
//  PickColorNameScreen.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 24/7/24.
//

import Foundation
import SwiftUI

struct PickColorNameScreen: View {
    

    @State var v1: Bool = false
    @State var v2: Bool = false
    @State var color1: SheetSelectedItem<Int> = SheetSelectedItem(description: "", item: 0, id: 0)
    @State var color2: SheetSelectedItem<Int> = SheetSelectedItem(description: "", item: 0, id: 0)
    
    
    var body: some View {
        VStack(alignment: .center){
            
            Text("Example 3")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            HStack{
                
                TextFieldBottomSheetView<ColorsSheetProvider,Int>(
                    visible: $v1,
                    item: $color1,
                    title: "Color 1",
                    content:
                        {
                            ColorsSheetProvider(value: $color1, isVisible: $v1)
                        }
                ).padding(.top, 6)
                
                TextFieldBottomSheetView<ColorsSheetProvider,Int>(
                    visible: $v2,
                    item: $color2,
                    title: "Color 2",
                    content:
                        {
                            ColorsSheetProvider(value: $color2, isVisible: $v2)
                        }
                ).padding(.top, 6)
            }

            
        }
        .padding(20)
    }
}

#Preview {
    PickColorNameScreen()
}

