# Custom Pickers with TextField BottomSheet
 Custom view named TextFieldBottomSheet that lets pick an object from a bottom sheet with a custom content provider and display in a textfield.

![ezgif-3-455e576c2f](https://github.com/user-attachments/assets/64e74c77-b953-4bdf-b995-4c611bf39f1b)

# Steps

The operation of this component consists of the next steps:
* The user presses on the TextField.
* A bottom sheet is displayed with a nested custom view with a set of values to pick from.
* The user picks whatever value.
* An instance that consists of two values (description: String) and (data: Any) is returned to be held as state variables in the view.
* The TextField is updated with the description value and the data value can be used for other stuff like persistence, validation and so on.

# Implementation

The central classes (types) are the following:
* TextFieldBottomSheetView
* SheetContentProvider
* SheetSelectedItem
* CustomListSheetProvider

# Description

The view TextFieldBottomSheetView is responsible for user interaction by providing the base view (which wraps a button, text field and a bottom sheet), showing a custom bottom sheet by holding a nested view that implements the protocol SheetContentProvider, state variable management by holding a generic struct SheetSelectedItem with a binding property wrapper that connects the caller (any view) and the TextFieldBottomSheetView.
The view CustomListSheetProvider is an implementation of the protocol SheetContentProvider that can be used to receive a list of objects of any type and show one version of a classic list picker or selector.
