

import SwiftUI

/// A full-screen progress overlay for modal operations like exporting.
public struct ExportProgressOverlay: View {
    let progress: Double
    let showPercentage: Bool
    let onCancel: (() -> Void)?

    public init(
        progress: Double = 0,
        showPercentage: Bool = true,
        onCancel: (() -> Void)? = nil
    ) {
        precondition(progress >= 0 && progress <= 1)
        self.progress = progress
        self.showPercentage = showPercentage
        self.onCancel = onCancel
    }

    public var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .transition(.opacity)

            VStack(spacing: 64) {
                // Progress card
                ProgressRing(progress: progress, showPercentage: showPercentage)
                    .padding(32)
                    .background(.regularMaterial) // Use material for a modern, adaptive look
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                    .transition(.scale.combined(with: .opacity))

                if let onCancel {
                    Button(action: onCancel) {
                        Text("Cancel", bundle: .module)
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .background {
                                Capsule().stroke(lineWidth: 2)
                            }
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
    }
}

/// A circular progress view with a percentage in the center.
private struct ProgressRing: View {
    let progress: Double
    let showPercentage: Bool

    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 8)

            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 0.2), value: progress)

            if showPercentage {
                Text(progress, format: .percent.precision(.fractionLength(0)))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .monospacedDigit()
                    .contentTransition(.numericText())
            }
        }
        .frame(width: 80, height: 80)
    }
}

#Preview {
    Form {
        Text("This is a test")
    }
    .overlay {
        ExportProgressOverlay(progress: 0.18) {
            print("Cancelled")
        }
    }
}
