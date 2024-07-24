//
//  SheetContentProvider.swift
//  TextFieldBottomSheet
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import SwiftUI

public protocol SheetContentProvider {
    associatedtype T: Any
    var value: Binding<SheetSelectedItem<T>> {get set}
    var isVisible: Binding<Bool> { get set }
}
