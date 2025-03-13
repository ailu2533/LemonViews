//
//  NumberInputField.swift
//  LemonViews
//
//  Created by Lu Ai on 2024/11/21.
//

#if canImport(UIKit)
    import SwiftUI
    import UIKit

    // MARK: - NumberInputField

    @available(iOS 13.0, *)
    public struct NumberInputField: UIViewRepresentable {
        // MARK: Lifecycle

        public init(
            value: Binding<Double>,
            placeholder: String,
            keyboardType: UIKeyboardType = .decimalPad,
            textAlignment: NSTextAlignment = .right,
            backgroundColor: UIColor = .clear,
            verticalPadding: CGFloat = 10
        ) {
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
                // 处理删除操作
                if string.isEmpty {
                    let currentText = textField.text ?? ""
                    guard let stringRange = Range(range, in: currentText) else { return false }
                    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

                    if updatedText.isEmpty {
                        self.parent.value = 0
                    } else if let value = Double(updatedText) {
                        self.parent.value = value
                    }
                    return true
                }

                // 验证输入字符
                let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
                guard allowedCharacters.isSuperset(of: CharacterSet(charactersIn: string)) else {
                    return false
                }

                // 获取更新后的文本
                let currentText = textField.text ?? ""
                guard let stringRange = Range(range, in: currentText) else { return false }
                let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

                // 处理小数点
                if string == "." {
                    // 不允许多个小数点
                    if currentText.contains(".") { return false }
                    // 不允许第一个字符就是小数点
                    if currentText.isEmpty { return false }
                    return true
                }

                // 验证数值范围
                if let value = Double(updatedText) {
                    return value <= 999999
                }

                return false
            }

            public func textFieldDidEndEditing(_ textField: UITextField) {
                if let text = textField.text, let value = Double(text) {
                    self.parent.value = value
                } else {
                    self.parent.value = 0
                }
            }

            // 新增: 文本框开始编辑时将光标移到最右边
            public func textFieldDidBeginEditing(_ textField: UITextField) {
                DispatchQueue.main.async {
                    let newPosition = textField.endOfDocument
                    textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
                }
            }

            public func textFieldDidChangeSelection(_ textField: UITextField) {
                DispatchQueue.main.async {
                    if let text = textField.text, !text.isEmpty, let value = Double(text) {
                        self.parent.value = value
                    } else {
                        self.parent.value = 0
                    }
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
            textField.backgroundColor = backgroundColor

            // 添加内边距
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: verticalPadding, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
            textField.rightView = paddingView
            textField.rightViewMode = .always

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
            let text = value == 0 ? "" : String(value)
            if uiView.text != text {
                uiView.text = text
            }
        }

        public func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        // MARK: Internal

        @Binding var value: Double
        var placeholder: String
        var keyboardType: UIKeyboardType
        var textAlignment: NSTextAlignment
        var backgroundColor: UIColor
        var verticalPadding: CGFloat
    }
#endif

#Preview {
    Form {
        NumberInputField(value: .constant(123), placeholder: "测试")

    }
}
