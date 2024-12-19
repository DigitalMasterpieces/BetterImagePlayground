import SwiftUI
import ImagePlayground
import BetterImagePlayground


struct ContentView: View {

    @State var showDefaultImagePlayground = false
    @State var showBetterImagePlayground = false

    var body: some View {
        VStack {
            Button(action: { self.showDefaultImagePlayground.toggle() }) {
                Label("Default Image Playground", systemImage: "apple.image.playground")
            }
            Button(action: { self.showBetterImagePlayground.toggle() }) {
                Label("Better Image Playground", systemImage: "wand.and.sparkles")
            }
            .tint(.orange)
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .imagePlaygroundSheet(isPresented: self.$showDefaultImagePlayground) { url in
            print("Image generated: \(url)")
        }
        .betterImagePlaygroundSheet(isPresented: self.$showBetterImagePlayground) { url in
            print("Image generated: \(url)")
        }
    }
}

#Preview {
    ContentView()
}
