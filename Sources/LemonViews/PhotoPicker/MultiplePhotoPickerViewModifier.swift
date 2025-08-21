//
//  MultiplePhotoPickerViewModifier.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/8/21.
//
import PhotosUI
import SwiftUI

// MARK: - MultiplePhotoPickerViewModifier

struct MultiplePhotoPickerViewModifier: ViewModifier {
    // MARK: - Properties

    @Binding var isPresented: Bool
    @State private var pickerItems: [PhotosPickerItem] = []

    let onSelect: ([PhotosPickerItem]) -> Void

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .photosPicker(
                isPresented: $isPresented,
                selection: $pickerItems,
                maxSelectionCount: 30,
                matching: .images
            )
            .onChange(of: pickerItems) { oldValue, newValue in
                guard oldValue.isEmpty, !newValue.isEmpty else { return }
                onSelect(newValue)
                pickerItems = []
            }
    }
}

extension View {
    public func multiplePhotoPicker(
        isPresented: Binding<Bool>,
        onSelect: @escaping ([PhotosPickerItem]) -> Void
    ) -> some View {
        modifier(
            MultiplePhotoPickerViewModifier(
                isPresented: isPresented,
                onSelect: onSelect
            )
        )
    }
}
