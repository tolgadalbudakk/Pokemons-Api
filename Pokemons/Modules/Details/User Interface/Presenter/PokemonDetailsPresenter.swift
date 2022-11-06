//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation

protocol PokemonDetailsPresenterInput {
    var output: PokemonDetailsPresenterOutput? { get set }
    var details: PokemonDetailsViewModel? { get }
    
    func viewWillAppear()
    func viewDidAppear()

}

protocol PokemonDetailsPresenterOutput: AnyObject {
    func updateUI()
    func presentLoading()

}

class PokemonDetailsPresenter: PokemonDetailsPresenterInput {
    
    weak var output: PokemonDetailsPresenterOutput?
    var interactor: PokemonDetailsInteractorInput
    var router: PokemonDetailsRouter
    
    var details: PokemonDetailsViewModel? {
        return viewModel
    }
    
    private var viewModel: PokemonDetailsViewModel? {
        didSet {
            output?.updateUI()
        }
    }
    
    init(interactor: PokemonDetailsInteractorInput, router: PokemonDetailsRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear() {
        output?.presentLoading()
    }
    
    func viewDidAppear() {
        interactor.fetchDetails(id: router.id)
    }
    

}

extension PokemonDetailsPresenter: PokemonDetailsInteractorOutput {
    
    func fetchedDetails(_ details: PokemonDetailsEntity) {
        viewModel = PokemonMapper.parse(from: details)
    }
}
