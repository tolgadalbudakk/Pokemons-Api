//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit

class PokemonListRouter {
    
    var navigationController: UINavigationController?
    
    func present(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = PokemonListViewControllerBuilder.make(router: self)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    func presentDetails(_ id: Int) {
        
        guard let navigationController = self.navigationController else { return }
        PokemonDetailsRouter(id: id).present(navigationController: navigationController)
    }
}
