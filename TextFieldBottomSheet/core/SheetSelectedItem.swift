//
//  SheetSelectedItem.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation

public struct SheetSelectedItem<Item>: Identifiable{
    public var id: Int
    public var description: String
    public var item: Item
    
    public init(description: String, item: Item, id: Int) {
        self.description = description
        self.item = item
        self.id = id
    }
}
