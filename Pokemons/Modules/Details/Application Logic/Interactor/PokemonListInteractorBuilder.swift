//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

class PokemonListInteractorBuilder {
    
    static func make(manager: PokemonListManagerInput) -> PokemonListInteractor{
        
        return PokemonListInteractor(manager: manager)
    }
}
