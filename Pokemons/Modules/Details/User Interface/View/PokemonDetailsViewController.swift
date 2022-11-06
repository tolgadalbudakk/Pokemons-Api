//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!

    
    var presenter: PokemonDetailsPresenterInput?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    

}

extension PokemonDetailsViewController: PokemonDetailsPresenterOutput {
    
    func updateUI() {
        let windows = presenter?.details
        
        DispatchQueue.main.async {
            self.view.stopActivity()
        }
        
        title = windows?.name
        infoLabel.text = windows?.info

        typeLabel.text = "Type: \(windows?.types ?? "")"
        effectLabel.text = "Effect: \(windows?.types ?? "")"

        attackLabel.text = "Attack: \(windows?.mainMove ?? "")"
        imageView.sd_setImage(with: windows?.image, completed: nil)
        
    }
    
    func presentLoading() {
        title = ""
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
    

}


