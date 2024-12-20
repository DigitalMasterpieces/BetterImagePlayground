# A Better Image Playground for SwiftUI

This package provides view modifiers for presenting an Image Playground in SwiftUI.
It's similar to the default `imagePlaygroundSheet(...)` modifier, but the presented Image Playground has much better presentation behavior and size.
See below for comparison screenshots.

## Usage
The Better Image Playground sheet is meant to be used as a 1:1 replacement for the system-provided sheet.
The view modifiers are almost identical, but start with a `better` prefix.

```swift
// Default Image Playground sheet:
Button(action: { self.showDefaultImagePlayground.toggle() }) {
    Label("Default Image Playground", systemImage: "apple.image.playground")
}
.imagePlaygroundSheet(isPresented: self.$showDefaultImagePlayground) { url in
    // ...
}

// Better Image Playground sheet:
Button(action: { self.showBetterImagePlayground.toggle() }) {
    Label("Better Image Playground", systemImage: "wand.and.sparkles")
}
.betterImagePlaygroundSheet(isPresented: self.$showBetterImagePlayground) { url in
    // ...
}
```

## Screenshots

### Mac Catalyst
Especially on Mac Catalyst (Mac idiom), the default Image Playground is way too small.
The version from this package is much larger and fully exposes all UI elements.

Default |  Better
:------:|:------:
![Catalyst default](./Images/Catalyst%20default.jpeg) | ![Catalyst better](Images/Catalyst%20better.jpeg)

### macOS
The native macOS version is also slightly larger, offering a larger preview and longer text field.

Default |  Better
:------:|:------:
![macOS default](./Images/macOS%20default.jpeg) | ![macOS better](Images/macOS%20better.jpeg)

### iPad
The better version for iPad uses more of the available space as well.

Default |  Better
:------:|:------:
![iPad default](./Images/iPad%20default.jpeg) | ![iPad better](Images/iPad%20better.jpeg)

### iPhone
The iPhone version looks the same as the default sheet.

Default |  Better
:------:|:------:
![iPhone default](./Images/iPhone%20default.jpeg) | ![iPhone better](Images/iPhone%20better.jpeg)
