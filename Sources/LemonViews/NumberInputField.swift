//
//  NumberInputField.swift
//  LemonViews
//
//  Created by Lu Ai on 2024/11/21.
//

import SwiftUI
import UIKit

// MARK: - NumberInputField

public struct NumberInputField: UIViewRepresentable {
    // MARK: Lifecycle

    public init(value: Binding<CGFloat>, placeholder: String, keyboardType: UIKeyboardType = .numberPad, textAlignment: NSTextAlignment = .center, backgroundColor: UIColor = .systemGray6, verticalPadding: CGFloat = 10) {
        _value = value
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.verticalPadding = verticalPadding
    }

    // MARK: Public

    public class Coordinator: NSObject, UITextFieldDelegate {
        // MARK: Lifecycle

        init(_ parent: NumberInputField) {
            self.parent = parent
        }

        // MARK: Public

        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            // 只允许输入数字
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)

            // 检查是否超过 Int64 的最大值
            if let potentialValue = Int64(updatedText), potentialValue <= 99999 {
                return allowedCharacters.isSuperset(of: characterSet)
            } else if updatedText.isEmpty {
                return true
            }

            return false
        }

        public func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text, !text.isEmpty, let value = Double(text) {
                parent.value = value
            } else {
                parent.value = 0
            }
        }

        // 新增: 文本框开始编辑时将光标移到最右边
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                let newPosition = textField.endOfDocument
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
        }

        // MARK: Internal

        var parent: NumberInputField

        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }

    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.returnKeyType = .done
        textField.textAlignment = textAlignment

//        // 设置背景颜色和圆角
//        textField.backgroundColor = backgroundColor // 使用系统灰色
//        textField.layer.cornerRadius = 10 // 设置圆角半径
//        textField.clipsToBounds = true
//
//        if verticalPadding > 0 {
//            // 添加左右内边距
//            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: verticalPadding, height: textField.frame.height))
//            textField.leftView = paddingView
//            textField.leftViewMode = .always
//            textField.rightView = paddingView
//            textField.rightViewMode = .always
//        }

        // 创建工具栏
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let image = UIImage(systemName: "keyboard.chevron.compact.down", withConfiguration: nil)
        let doneButton = UIBarButtonItem(image: image, style: .plain, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexSpace, doneButton]

        textField.inputAccessoryView = toolbar

        return textField
    }

    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = value == 0 ? "" : "\(value)"
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: Internal

    @Binding var value: CGFloat
    var placeholder: String
    var keyboardType: UIKeyboardType
    var textAlignment: NSTextAlignment
    var backgroundColor: UIColor
    var verticalPadding: CGFloat
}
