import ImagePlayground
import SwiftUI

#if canImport(UIKit)
import UIKit

@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public extension View {
    
    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concepts:sourceImage:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept] = [], sourceImage: UIImage? = nil, onCompletion: @escaping (URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.sheet(isPresented: isPresented) {
            ImagePlayground(isPresented: isPresented, concepts: concepts, sourceImage: sourceImage, onCompletion: onCompletion, onCancellation: onCancellation)
                .modifier(ImagePlaygroundPresentationModifier())
        }
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concepts:sourceImageURL:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept] = [], sourceImageURL: URL, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concepts: concepts, sourceImage: UIImage(contentsOfFile: sourceImageURL.path), onCompletion: onCompletion, onCancellation: onCancellation)
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concept:sourceImageURL:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concept: String, sourceImageURL: URL, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concept: concept, sourceImage: UIImage(contentsOfFile: sourceImageURL.path), onCompletion: onCompletion, onCancellation: onCancellation)
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concept:sourceImage:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concept: String, sourceImage: UIImage? = nil, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concepts: [.text(concept)], sourceImage: sourceImage, onCompletion: onCompletion, onCancellation: onCancellation)
    }

}

#elseif canImport(AppKit)
import AppKit

@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public extension View {

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concepts:sourceImage:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept] = [], sourceImage: NSImage? = nil, onCompletion: @escaping (URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.sheet(isPresented: isPresented) {
            ImagePlayground(isPresented: isPresented, concepts: concepts, sourceImage: sourceImage, onCompletion: onCompletion, onCancellation: onCancellation)
                .modifier(ImagePlaygroundPresentationModifier())
        }
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concepts:sourceImageURL:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concepts: [ImagePlaygroundConcept] = [], sourceImageURL: URL, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concepts: concepts, sourceImage: NSImage(contentsOf: sourceImageURL), onCompletion: onCompletion, onCancellation: onCancellation)
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concept:sourceImageURL:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concept: String, sourceImageURL: URL, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concept: concept, sourceImage: NSImage(contentsOf: sourceImageURL), onCompletion: onCompletion, onCancellation: onCancellation)
    }

    /// Presents the system sheet to create images from the specified input.
    ///
    /// Add this modifier to a view to display the system’s image-creation sheet.
    ///
    /// The presented sheet has better presentation behavior and size than the system sheet,
    /// otherwise it behaves the same way.
    ///
    /// See ``imagePlaygroundSheet(isPresented:concept:sourceImage:onCompletion:onCancellation:)``.
    @MainActor func betterImagePlaygroundSheet(isPresented: Binding<Bool>, concept: String, sourceImage: NSImage? = nil, onCompletion: @escaping (_ url: URL) -> Void, onCancellation: (() -> Void)? = nil) -> some View {
        self.betterImagePlaygroundSheet(isPresented: isPresented, concepts: [.text(concept)], sourceImage: sourceImage, onCompletion: onCompletion, onCancellation: onCancellation)
    }

}

#endif
