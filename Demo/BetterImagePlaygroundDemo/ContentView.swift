import SwiftUI
import ImagePlayground
import BetterImagePlayground


struct ContentView: View {

    @State var showDefaultImagePlayground = false

    var body: some View {
        VStack {
            Button(action: { self.showDefaultImagePlayground.toggle() }) {
                Label("Default Image Playground", systemImage: "apple.image.playground")
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .imagePlaygroundSheet(isPresented: self.$showDefaultImagePlayground) { url in
            print("Image generated: \(url)")
        }
    }
}

#Preview {
    ContentView()
}
