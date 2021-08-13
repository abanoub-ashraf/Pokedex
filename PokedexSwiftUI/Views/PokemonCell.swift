import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: PokemonModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color.white)
                        /// the padding should be before the overlay
                        ///
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        /// to put the text inside something
                        ///
                        .overlay(
                            /// a rounded shape, aligned inside the frame of the view containing it
                            ///
                            RoundedRectangle(cornerRadius: 20)
                                /// fill the RoundedRectangle with this color
                                ///
                                .fill(Color.init(.label).opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    /// load the image of each pokemon from the internet using kingfisher
                    ///
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(pokemon.color)
        .cornerRadius(12)
        .shadow(color: pokemon.color, radius: 4, x: 0.0, y: 0.0)
    }
}
