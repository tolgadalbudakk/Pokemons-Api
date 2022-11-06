//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation
import UIKit

class PokemonDetailsRouter {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func present(navigationController: UINavigationController) {
        navigationController.pushViewController(PokemonDetailsViewControllerBuilder.make(router: self), animated: true)
    }
}
