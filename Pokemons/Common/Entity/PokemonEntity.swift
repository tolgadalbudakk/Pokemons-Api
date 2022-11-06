//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation
import UIKit

struct PokemonEntity {
    
    var name: String = ""
    var pokemonURL: String = ""
    var id: Int = 0
    var image: String = ""

    init(name: String, pokemonURL: String, image: String){
        self.name = name
        self.pokemonURL=pokemonURL
        self.image = image
        self.id = Int(pokemonURL.split(separator: "/", maxSplits: 13, omittingEmptySubsequences: true)[5])!
    }
}
