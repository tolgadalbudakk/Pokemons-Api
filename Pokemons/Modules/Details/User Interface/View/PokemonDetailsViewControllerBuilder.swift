//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

class PokemonDetailsViewControllerBuilder {
    
    static func make(router: PokemonDetailsRouter) -> PokemonDetailsViewController {
        let viewController = PokemonDetailsViewController(nibName: String(describing: PokemonDetailsViewController.self), bundle: nil)
        let manager = PokemonDetailsManager()
        let interactor = PokemonDetailsInteractor(manager: manager)
        let presenter = PokemonDetailsPresenter(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
