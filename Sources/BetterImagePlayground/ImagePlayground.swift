import ImagePlayground
import SwiftUI


#if canImport(UIKit)
import UIKit

/// Helper `View` for wrapping an `ImagePlaygroundViewController` to be used in SwiftUI.
///
/// This is used to place an Image Playground into our own sheet, so that we can freely
/// customize its size and presentation behavior to our liking.
@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
struct ImagePlayground: UIViewControllerRepresentable {

    @Binding var isPresented: Bool
    let concepts: [ImagePlaygroundConcept]
    let sourceImage: UIImage?
    let onCompletion: (URL) -> Void
    let onCancellation: (() -> Void)?


    init(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept], sourceImage: UIImage?, onCompletion: @escaping (URL) -> Void, onCancellation: (() -> Void)?) {
        self._isPresented = isPresented
        self.concepts = concepts
        self.sourceImage = sourceImage
        self.onCompletion = onCompletion
        self.onCancellation = onCancellation
    }

    func makeUIViewController(context: Context) -> ImagePlaygroundViewController {
        let viewController = ImagePlaygroundViewController()
        viewController.concepts = self.concepts
        viewController.sourceImage = self.sourceImage
        viewController.delegate = context.coordinator
        return viewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func updateUIViewController(_ uiViewController: ImagePlaygroundViewController, context: Context) {}
}

#elseif canImport(AppKit)
import AppKit

/// Helper `View` for wrapping an `ImagePlaygroundViewController` to be used in SwiftUI.
///
/// This is used to place an Image Playground into our own sheet, so that we can freely
/// customize its size and presentation behavior to our liking.
@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
struct ImagePlayground: NSViewControllerRepresentable {

    @Binding var isPresented: Bool
    let concepts: [ImagePlaygroundConcept]
    let sourceImage: NSImage?
    let onCompletion: (URL) -> Void
    let onCancellation: (() -> Void)?


    init(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept], sourceImage: NSImage?, onCompletion: @escaping (URL) -> Void, onCancellation: (() -> Void)?) {
        self._isPresented = isPresented
        self.concepts = concepts
        self.sourceImage = sourceImage
        self.onCompletion = onCompletion
        self.onCancellation = onCancellation
    }

    func makeNSViewController(context: Context) -> ImagePlaygroundViewController {
        let viewController = ImagePlaygroundViewController()
        viewController.concepts = self.concepts
        viewController.sourceImage = self.sourceImage
        viewController.delegate = context.coordinator
        return viewController
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

     func updateNSViewController(_ uiViewController: ImagePlaygroundViewController, context: Context) {}
}

#endif

@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ImagePlayground {

    class Coordinator: NSObject, ImagePlaygroundViewController.Delegate {

        var parent: ImagePlayground

        init(_ parent: ImagePlayground) {
            self.parent = parent
        }

        func imagePlaygroundViewController(_ imagePlaygroundViewController: ImagePlaygroundViewController, didCreateImageAt imageURL: URL) {
            // Dismiss the Image Playground when an image was generated.
            self.parent.isPresented = false
            self.parent.onCompletion(imageURL)
        }

        func imagePlaygroundViewControllerDidCancel(_ imagePlaygroundViewController: ImagePlaygroundViewController) {
            // Dismiss the Image Playground when it was cancelled.
            self.parent.isPresented = false
            self.parent.onCancellation?()
        }

    }

}
