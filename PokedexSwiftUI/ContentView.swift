import SwiftUI

struct ContentView: View {
    /// to customize the navigation bar
    ///
    init() {
        UINavigationBar.appearance().tintColor = .label
    }
    
    var body: some View {
        PokedexView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
