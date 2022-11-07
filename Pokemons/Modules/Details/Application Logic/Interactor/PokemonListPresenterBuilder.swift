//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

class PokemonListPresenterBuilder {
    
    static func make(interactor: PokemonListInteractorInput, router: PokemonListRouter) -> PokemonListPresenter{
        let presenter = PokemonListPresenter(interactor: interactor, router: router)
        
        return presenter
    }
}
