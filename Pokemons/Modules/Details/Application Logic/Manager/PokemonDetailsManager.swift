//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

protocol PokemonDetailsManagerInput {
    func getPokemonDetails(id: String, completion: @escaping ((PokemonDetailsAPIModel) -> ()))
}

class PokemonDetailsManager: PokemonDetailsManagerInput {
    
    var object: PokemonDetailsAPIModel?
    
    func getPokemonDetails(id: String, completion: @escaping ((PokemonDetailsAPIModel) -> ())) {
        PokemonAPI.shared.getPokemon(id: id) {
            pokemon in
            
            self.object = pokemon
            guard let object = self.object else { return }
            completion(object)
        }
    }
}
