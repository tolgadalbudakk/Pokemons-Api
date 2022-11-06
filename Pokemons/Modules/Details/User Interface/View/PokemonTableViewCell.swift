//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemons = [PokemonStats]()
    var pokemon: PokemonStats?
    var display: PokemonListItemViewModel?
    
    func setUp() {
        guard let display = self.display else { return }

        pokemonNameLabel.text = display.name

    


    }
    
}

extension UIImageView{
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.sync { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill){
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
    

    

 
