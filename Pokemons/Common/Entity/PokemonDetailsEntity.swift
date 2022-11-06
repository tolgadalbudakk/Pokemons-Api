//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

struct PokemonDetailsEntity {
    
    var name: String = ""
    var effect: String = ""
    var order: Int = 0
    var id: Int = 0
    var weight: Int = 0
    var height: Int = 0
    var baseExperience: Int = 0
    var image: String = ""
    var types: [String] = []
    var mainMove: String = ""
}
