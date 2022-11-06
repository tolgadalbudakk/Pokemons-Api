//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

protocol PokemonListPresenterInput {
    var pokemonCount: Int { get }
    var title: String { get }
    
    func viewDidLoad()
    func didSelectCell(at index: Int)
    func getPokemon(at index: Int) -> PokemonListItemViewModel
}

protocol PokemonListPresenterOutput: AnyObject {
    func updateUIList()
    func presentLoading()
}

class PokemonListPresenter: PokemonListPresenterInput {
    
    weak var output: PokemonListPresenterOutput?
    var interactor: PokemonListInteractorInput
    var router: PokemonListRouter
    
    var pokemonCount: Int {
        return viewModel.count
    }

    var title: String {
        return "Pokemon List"
    }
    
    private var viewModel: [PokemonListItemViewModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    

    init(interactor: PokemonListInteractorInput, router: PokemonListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        output?.presentLoading()
        DispatchQueue(label: "Fetch Pokemon").async {
            self.interactor.fetch()
        }

    }
    
    func didSelectCell(at index: Int) {
        let pokemon = viewModel[index]
        let id = pokemon.id
        
        router.presentDetails(id)
    }
    

    func getPokemon(at index: Int) -> PokemonListItemViewModel {
        return viewModel[index]
    }
}

extension PokemonListPresenter {
    
    private func sortOptionsToString(options: [SortType]) -> [String] {
        
        var sortOptions = [String]()
        
        for option in options {
            sortOptions.append(option.rawValue)
        }
        
        return sortOptions
    }
    

}

extension PokemonListPresenter: PokemonListInteractorOutput {

    func fetched(pokemons: [PokemonEntity]) {
        self.viewModel = PokemonMapper.parse(from: pokemons)
    }
    

}
