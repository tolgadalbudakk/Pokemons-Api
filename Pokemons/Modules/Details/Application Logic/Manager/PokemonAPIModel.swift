//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation
import ObjectMapper

class PokemonAPIModel: Mappable {
    
    var name: String = ""
    var url: String = ""
    var image: String = ""
    var effect: String = ""


    required init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        effect <- map["effect"]

        image <- map["image"]
        url <- map["url"]
    }
}
