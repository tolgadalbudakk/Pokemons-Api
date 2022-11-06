//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

protocol PokemonListManagerInput {
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ())
}

class PokemonListManager: PokemonListManagerInput {
    
    var objects: [PokemonAPIModel] = []
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        PokemonAPI.shared.getPokemons {
            objects in
            
            self.objects = objects
            completion(self.objects)
        }
    }
}
