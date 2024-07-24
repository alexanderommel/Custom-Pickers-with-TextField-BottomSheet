//
//  NamesSheetProvider.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import SwiftUI


public struct Names{
    public var firstname: String
    public var lastname: String
    public init(firstname: String, lastname: String) {
        self.firstname = firstname
        self.lastname = lastname
    }
}


public struct NamesSheetProvider: View, SheetContentProvider {
    

    public var value: Binding<SheetSelectedItem<Names>>
    public var isVisible: Binding<Bool>
    @State var firstname: String = ""
    @State var lastname: String = ""
        
    public var body: some View {
        VStack(alignment: .center){
            
            HStack{
                Spacer()
            }
            
            TextField("Firstname",text: $firstname)
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color.blue)
             .padding(.bottom, 20)
            
            TextField("Lastname",text: $lastname)
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color.blue)
            
            Button{
                if( !firstname.isEmpty && !lastname.isEmpty ){
                    value.wrappedValue.item = Names(firstname: firstname, lastname: lastname)
                    value.wrappedValue.description = "\(firstname) \(lastname)"
                    value.wrappedValue.id = 1
                }
                isVisible.wrappedValue.toggle()
            } label: {
                Text("Accept")
            }
            .padding(20)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
        }
    }
    
    public init(value: Binding<SheetSelectedItem<T>>, isVisible: Binding<Bool>) {
        self.value = value
        self.isVisible = isVisible
    }
}
