import SwiftUI

struct ContentView: View {
    var body: some View {
        AccountView().environment(StateController())
    }
}

#Preview {
    ContentView()
}
