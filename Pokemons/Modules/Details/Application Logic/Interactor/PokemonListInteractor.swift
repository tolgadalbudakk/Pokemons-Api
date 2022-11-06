//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

protocol PokemonListInteractorInput {
    func fetch()
}

protocol PokemonListInteractorOutput: AnyObject {
    func fetched(pokemons: [PokemonEntity])
}

enum SortType: String {
    case byId = "Por Id"
}

class PokemonListInteractor: PokemonListInteractorInput {
    
    weak var output: PokemonListInteractorOutput?
    var manager: PokemonListManagerInput
    
    var entities: [PokemonEntity] = []
    
    init(manager: PokemonListManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getPokemons {
            pokemons in
            
            self.entities = PokemonMapper.parse(from: pokemons)
            self.output?.fetched(pokemons: self.entities)
        }
    }
    

}
