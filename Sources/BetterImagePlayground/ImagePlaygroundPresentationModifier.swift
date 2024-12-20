import SwiftUI


/// The view modifier that does the presentation and sizing changes to the Image Playground.
///
/// The actual changes depend on the target platform and in case of Catalyst also on the chosen idiom.
@available(iOS 18.2, macOS 15.2, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
struct ImagePlaygroundPresentationModifier: ViewModifier {

#if targetEnvironment(macCatalyst)

    // MARK: Mac Catalyst

    var isMacIdiom: Bool { UIDevice.current.userInterfaceIdiom == .mac }

    func body(content: Content) -> some View {
        // On Catalyst, especially when using the `mac` idiom, the default playground is very small.
        // We give it a much larger ideal size and also provide a minimum size, which makes the sheet resizable.
        //
        // We also fix the top margin of the buttons to be the same as the margins to the side of the sheet
        // (differently based on the idiom).
        content
            .presentationSizing(.fitted)
            .frame(minWidth: 530, idealWidth: 780,
                   minHeight: 480, idealHeight: 650)
            .padding(.top, self.isMacIdiom ? 10 : 4)
    }

#elseif os(macOS)

    // MARK: macOS

    func body(content: Content) -> some View {
        // On native macOS, we just slightly increase the default size from 700x500 to 800x600.
        content
            .presentationSizing(.fitted)
            .frame(width: 800, height: 600)
    }

#else

    // MARK: iOS

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    func body(content: Content) -> some View {

        // On iOS and iPadOS, the default playground seems to be using the `form` sheet size.
        // We increase the size to the `page` sizing, which is much larger so that it shows
        // all the menu options expanded and gives a larger preview of the generated image.
        // Note: This does not have an effect on an iPhone where the sheet is always full-screen.
        //
        // We also fix the top margin of the buttons to be the same as the margins to the side of the sheet
        // for regular screen hight, to save a bit of space in compact environment.
        content
            .presentationSizing(.page)
            .padding(.top, horizontalSizeClass == .regular ? 10 : 0)
    }

#endif

}
