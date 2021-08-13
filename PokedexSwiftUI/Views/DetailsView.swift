import SwiftUI
import Kingfisher

struct DetailsView: View {
    let pokemon: PokemonModel
    
    var body: some View {
        VStack {
            Spacer(minLength: 16)
            
            KFImage(URL(string: pokemon.imageUrl))
                .padding(.bottom, 8)
                                    
            Text(pokemon.name.capitalized)
                .font(.system(size: 25))
                .fontWeight(.heavy)
                .bold()
                .frame(width: 250, height: 30)
                .padding(.bottom, 8)
                                    
            Text(pokemon.type.capitalized)
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
            
            Spacer(minLength: 3)
            
            Text(pokemon.description)
                .padding([.leading, .trailing], 16)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(pokemon.color)
        .edgesIgnoringSafeArea(.all)
    }
}

