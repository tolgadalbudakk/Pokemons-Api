//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

class PokemonMapper {
    
    static func parse(from pokemons: [PokemonAPIModel]) -> [PokemonEntity] {
        
        var array: [PokemonEntity] = []
        
        for pokemon in pokemons {
            array.append(PokemonEntity(name: pokemon.name, pokemonURL: pokemon.url, image: pokemon.image))
        }
        
        return array
    }
    
    static func parse(from pokemons: [PokemonEntity]) -> [PokemonListItemViewModel] {
        
        var array: [PokemonListItemViewModel] = []
        
        for pokemon in pokemons {
            array.append(PokemonListItemViewModel(name: pokemon.name, url: pokemon.pokemonURL, image: URL(string: pokemon.image), id: pokemon.id))
        }

        return array
    }
    
    static func parse(from details: PokemonDetailsAPIModel) -> PokemonDetailsEntity {
        
        var types = [String]()
               
               for type in details.types {
                   guard let _type = type["type"] as? [String : Any] else {
                       return PokemonDetailsEntity(name: "", effect: "", order: 0, id: 0, weight: 0, height: 0, baseExperience: 0, image: "", types: [],  mainMove: "")
                   }
                   types.append(_type["name"] as! String)
               }
        
        guard let move = details.moves[0]["move"] as? [String : Any] else{
            
            return PokemonDetailsEntity(name: "", effect: "", order: 0, id: 0, weight: 0, height: 0, baseExperience: 0, image: "", types: [], mainMove: "")
        }
        
        return PokemonDetailsEntity(name: details.name, effect: details.effect, order: details.order, id: details.id, weight: details.weight, height: details.height, baseExperience: details.baseExperience, image: details.sprites["front_default"] as! String, types: types, mainMove: move["name"] as! String)
    }
    
    static func parse(from details: PokemonDetailsEntity) -> PokemonDetailsViewModel {
        
        var typeString = ""
        
        for type in details.types {
            typeString.append(contentsOf: "\(type) ")
        }
        
        return PokemonDetailsViewModel(name: details.name, info:  "Order: \(details.order)\n Weight: \(details.weight)\n Height: \(details.height)\n Base experience: \(details.baseExperience)", effect: details.effect, id: details.id, image: URL(string: details.image) , types: typeString, mainMove: details.mainMove)
    }
}
