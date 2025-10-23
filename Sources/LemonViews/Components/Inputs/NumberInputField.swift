////
////  NumberInputField.swift
////  LemonViews
////
////  Created by Lu Ai on 2024/11/21.
////
//
// #if canImport(UIKit)
//    import SwiftUI
//    import UIKit
//
//    // MARK: - NumberInputField
//
//    @available(iOS 13.0, *)
//    public struct NumberInputField: UIViewRepresentable {
//        // MARK: Lifecycle
//
//        public init(
//            value: Binding<Double>,
//            placeholder: String,
//            keyboardType: UIKeyboardType = .decimalPad,
//            textAlignment: NSTextAlignment = .right,
//            backgroundColor: UIColor = .clear,
//            verticalPadding: CGFloat = 10
//        ) {
//            _value = value
//            self.placeholder = placeholder
//            self.keyboardType = keyboardType
//            self.textAlignment = textAlignment
//            self.backgroundColor = backgroundColor
//            self.verticalPadding = verticalPadding
//        }
//
//        // MARK: Public
//
//        public class Coordinator: NSObject, UITextFieldDelegate {
//            // MARK: Lifecycle
//
//            init(_ parent: NumberInputField) {
//                self.parent = parent
//
//                // 配置 NumberFormatter
//                formatter.numberStyle = .decimal
//                formatter.maximumFractionDigits = 2
//                formatter.minimumFractionDigits = 0
//                formatter.groupingSeparator = ""  // 不使用千位分隔符
//            }
//
//            // MARK: Public
//
//            public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//                // 1. 处理删除操作
//                if string.isEmpty {
//                    return true
//                }
//
//                // 2. 获取当前文本和更新后的文本
//                let currentText = textField.text ?? ""
//                guard let stringRange = Range(range, in: currentText) else { return false }
//                let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//
//                // 3. 基本验证规则
//                // 最大长度限制（包括小数点）
//                if updatedText.count > 10 { return false }
//
//                // 4. 小数点处理
//                if string == "." {
//                    // 不允许多个小数点
//                    if currentText.contains(".") { return false }
//                    // 不允许第一个字符就是小数点
//                    if currentText.isEmpty { return false }
//                    return true
//                }
//
//                // 5. 小数位数控制
//                if currentText.contains(".") {
//                    let components = updatedText.components(separatedBy: ".")
//                    if components.count > 1 && components[1].count > 2 {
//                        return false // 限制小数点后最多2位
//                    }
//                }
//
//                // 6. 数字验证
//                // 只允许输入数字
//                let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
//                if !allowedCharacters.isSuperset(of: CharacterSet(charactersIn: string)) {
//                    return false
//                }
//
//                // 7. 数值范围验证
//                if let value = Double(updatedText) {
//                    // 限制最大值
//                    if value > 999999 { return false }
//                }
//
//                return true
//            }
//
//            public func textFieldDidEndEditing(_ textField: UITextField) {
//                isUserInput = false
//                guard let text = textField.text, !text.isEmpty else {
//                    self.parent.value = 0
//                    textField.text = ""
//                    return
//                }
//
//                // 1. 清理输入文本，只保留数字和小数点
//                let cleaned = text.filter { "0123456789.".contains($0) }
//
//                // 2. 尝试转换为数字
//                if let value = Double(cleaned) {
//                    // 3. 检查是否超过最大值
//                    if value > 999999 {
//                        self.parent.value = 999999
//                        if let formattedText = formatter.string(from: NSNumber(value: 999999)) {
//                            textField.text = formattedText
//                        }
//                    } else {
//                        // 4. 格式化数字
//                        if let formattedText = formatter.string(from: NSNumber(value: value)) {
//                            textField.text = formattedText
//                            self.parent.value = value
//                        }
//                    }
//                } else {
//                    // 5. 无效输入处理
//                    self.parent.value = 0
//                    textField.text = ""
//                }
//            }
//
//            // 新增: 文本框开始编辑时将光标移到最右边
//            public func textFieldDidBeginEditing(_ textField: UITextField) {
//                isUserInput = true
//                DispatchQueue.main.async {
//                    let newPosition = textField.endOfDocument
//                    textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
//                }
//            }
//
//            public func textFieldDidChangeSelection(_ textField: UITextField) {
//                // 在输入过程中，只更新非空且有效的数值
//                if let text = textField.text, !text.isEmpty {
//                    let cleaned = text.filter { "0123456789.".contains($0) }
//                    if let value = Double(cleaned) {
//                        self.parent.value = value
//                    }
//                }
//            }
//
//            // MARK: Internal
//
//            private let formatter = NumberFormatter()
//            var parent: NumberInputField
//            private var isUserInput = false
//
//            @objc func doneButtonTapped() {
//                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//            }
//        }
//
//        public func makeUIView(context: Context) -> UITextField {
//            let textField = UITextField()
//            textField.delegate = context.coordinator
//            textField.placeholder = placeholder
//            textField.keyboardType = keyboardType
//            textField.returnKeyType = .done
//            textField.textAlignment = textAlignment
//            textField.backgroundColor = backgroundColor
//
//            // 添加内边距
//            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: verticalPadding, height: textField.frame.height))
//            textField.leftView = paddingView
//            textField.leftViewMode = .always
//            textField.rightView = paddingView
//            textField.rightViewMode = .always
//
//            // 创建工具栏
//            let toolbar = UIToolbar()
//            toolbar.sizeToFit()
//
//            let image = UIImage(systemName: "keyboard.chevron.compact.down", withConfiguration: nil)
//            let doneButton = UIBarButtonItem(image: image, style: .plain, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))
//
//            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//            toolbar.items = [flexSpace, doneButton]
//
//            textField.inputAccessoryView = toolbar
//
//            return textField
//        }
//
//        public func updateUIView(_ uiView: UITextField, context: Context) {
//            if !context.coordinator.isUserInput {
//                let text = value == 0 ? "" : String(value)
//                if uiView.text != text {
//                    uiView.text = text
//                }
//            }
//        }
//
//        public func makeCoordinator() -> Coordinator {
//            Coordinator(self)
//        }
//
//        // MARK: Internal
//
//        @Binding var value: Double
//        var placeholder: String
//        var keyboardType: UIKeyboardType
//        var textAlignment: NSTextAlignment
//        var backgroundColor: UIColor
//        var verticalPadding: CGFloat
//    }
// #endif
//
