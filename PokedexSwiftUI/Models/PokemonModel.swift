import SwiftUI

struct PokemonModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    
    var color: Color {
        switch self.type {
            case "poison":
                return .purple
            case "fire":
                return .red
            case "water":
                return .blue
            case "bug":
                return .orange
            case "flying":
                return .pink
            case "grass":
                return .green
            case "ground":
                return .init(.secondaryLabel)
            case "electric":
                return .yellow
            case "normal":
                return .init(.systemTeal)
            case "psychic":
                return .secondary
            case "steel":
                return .gray
            case "ice":
                return .init(.lightGray)
            case "fighting":
                return .init(.magenta)
            case "rock":
                return .init(.brown)
            case "dragon":
                return .init(.systemRed)
            case "fairy":
                return .init(.systemPink)
            default:
                return .init(.systemIndigo)
        }
    }
}
