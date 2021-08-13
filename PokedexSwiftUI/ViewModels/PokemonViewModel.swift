import SwiftUI

/// a type alias for the Combine’s type for an object with a publisher that emits before the object has changed
///
class PokemonViewModel: ObservableObject {
    /// a type alias for the Combine’s type that publishes a property marked with an attribute
    ///
    @Published var pokemons = [PokemonModel]()
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: Constants.baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,"), error == nil else { return }
            
            guard let pokemons = try? JSONDecoder().decode([PokemonModel].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        }.resume()
    }
}
