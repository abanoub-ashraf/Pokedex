import SwiftUI

struct PokedexView: View {
    /// A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes
    /// initializing this view model will call the fetchPokemon() inside the view model and that will fill the pokemons array in the view model with api data
    ///
    @ObservedObject var viewModel = PokemonViewModel()
    
    /// this tells the grid that we need only two items per row
    /// a description of a single grid item, such as a row or a column
    /// You use GridItem instances to configure the layout of items in LazyHGrid and LazyVGrid
    ///
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
        
    var body: some View {
        /// this is like a navigation controller in uikit
        ///
        NavigationView {
            /// grid inside a scroll view is like a collection view in uikit
            ///
            ScrollView {
                /// A container view that arranges its child views in a grid that grows vertically
                /// it creates items inside of it only as needed
                ///
                LazyVGrid(columns: gridItems, spacing: 14) {
                    /// this pokemons array will be filled with api data when the PokemonViewModel was initialized above as an observed object variable
                    ///
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(
                            destination: DetailsView(pokemon: pokemon)) {
                            PokemonCell(pokemon: pokemon)
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}
