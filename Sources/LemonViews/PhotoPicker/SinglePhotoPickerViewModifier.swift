//
//  SinglePhotoPickerViewModifier.swift
//  LemonThingsManagerMainCloset
//
//  Created by Lu Ai on 2025/8/18.
//

import PhotosUI
import SwiftUI

// MARK: - SinglePhotoPickerViewModifier

struct SinglePhotoPickerViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    @State private var photosPickerItem: PhotosPickerItem?

    let onSelect: (PhotosPickerItem) async -> Void

    func body(content: Content) -> some View {
        content
            .photosPicker(isPresented: $isPresented, selection: $photosPickerItem, matching: .images)
            .onChange(of: photosPickerItem) { oldValue, newValue in
                guard oldValue == nil, let newValue else { return }
                Task {
                    await onSelect(newValue)
                    photosPickerItem = nil
                }
            }
    }
}

extension View {
    public func singlePhotoPicker(
        isPresented: Binding<Bool>,
        onSelect: @MainActor @escaping (PhotosPickerItem) async -> Void
    ) -> some View {
        modifier(
            SinglePhotoPickerViewModifier(
                isPresented: isPresented,
                onSelect: onSelect
            )
        )
    }
}
