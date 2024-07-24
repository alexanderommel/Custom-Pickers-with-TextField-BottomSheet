//
//  PickPersonScreen.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import SwiftUI

struct PickPersonScreen: View {
    
    
    
    @State var person_picked: SheetSelectedItem<Person> = SheetSelectedItem(description: "", item: Person(id: 0, firstname: "", lastname: "", phone: ""), id: 0)
    @State var visibleModal: Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            Text("Example 1")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .padding(.bottom, 30)
            
            TextFieldBottomSheetView<CustomListSheetProvider<Person>,Person>(
                visible: $visibleModal,
                item: $person_picked,
                title: "Best Friend",
                content:
                    {
                        CustomListSheetProvider<Person>(value: $person_picked, isVisible: $visibleModal, items: persons)
                    }
            ).padding(.top, 6)
            
            if(person_picked.id != 0){
                Text("My Best friend phone number is: \(person_picked.item.phone)")
                    .font(.subheadline)
                    .foregroundStyle(.green)
            }
            
        }
        .padding(20)
    }
}

#Preview {
    PickPersonScreen()
}


var persons: [SheetSelectedItem<Person>] = [
    SheetSelectedItem(description: "Rommel Valdiviezo", item: Person(id: 1, firstname: "Rommel", lastname: "Valdiviezo", phone: "0966564544"), id: 1),
    SheetSelectedItem(description: "Sheccid Verdezoto", item: Person(id: 2, firstname: "Sheccid", lastname: "Verdezoto", phone: "0967784433"), id: 2),
    SheetSelectedItem(description: "Alexander Diaz", item: Person(id: 3, firstname: "Alexander", lastname: "Diaz", phone: "0986687766"), id: 3)
]
