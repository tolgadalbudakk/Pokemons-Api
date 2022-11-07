//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class PokemonAPI{
    
    var baseURL = "https://pokeapi.co/api/v2/pokemon/"
    static var shared: PokemonAPI = PokemonAPI()
    
    private init() { }
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        
        let pokemonURL = baseURL+"?offset=0&limit=20"
        
        request(url: pokemonURL){(json) in
            
            guard let _json = json, let pokemons = Mapper<PokemonAPIModel>().mapArray(JSONObject: _json["results"]) else{
                completion([])
                return
            }
            
            completion(pokemons)
            
        }
        
    }
    
    func getPokemon(id: String, completion: @escaping (PokemonDetailsAPIModel) -> ()){

        let pokemonURL = baseURL+id

        request(url: pokemonURL){
            (json) in

            guard let _json = json, let pokemon = Mapper<PokemonDetailsAPIModel>().map(JSON: _json ) else{

                return
            }
            completion(pokemon)
        }
    }
    
    func getPokemon2(effect: String, completion: @escaping (PokemonDetailsAPIModel) -> ()){

        let pokemonURL = baseURL+effect

        request(url: pokemonURL){
            (json) in

            guard let _json = json, let pokemon = Mapper<PokemonDetailsAPIModel>().map(JSON: _json ) else{

                return
            }
            completion(pokemon)
        }
    }
    
    private func request(url: String, completion: @escaping ([String: Any]?) -> ()){
        
        guard let url = URL(string: url) else{ return }
        
        let _ = Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
            
            completion(response.result.value as? [String : Any])
        })
    }
}

