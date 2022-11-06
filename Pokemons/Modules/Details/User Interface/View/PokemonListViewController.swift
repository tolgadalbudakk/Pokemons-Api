//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit
import SDWebImage
import Foundation

class PokemonListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: PokemonListPresenterInput?
    var pokemons = [PokemonStats]()
    
    var pokemon: PokemonStats?
    
    let pokemonsString = [("001"),("002"),("003"),("004"),("005"),("006"),("007"),("008"),("009"),("010"),("011"),("012"),("013"),("014"),("015"),("016"),("017"),("018"),("019"),("020")]
    let pokemonImages = [UIImage(named: "001"), UIImage(named: "002"), UIImage(named: "003"), UIImage(named: "004"), UIImage(named: "005"),UIImage(named: "006"), UIImage(named: "007"), UIImage(named: "008"), UIImage(named: "009"), UIImage(named: "010"),UIImage(named: "011"), UIImage(named: "012"), UIImage(named: "013"), UIImage(named: "014"), UIImage(named: "015"), UIImage(named: "016"), UIImage(named: "017"), UIImage(named: "018"), UIImage(named: "019"), UIImage(named: "020")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none


        setUpTableView()
        setUpNavigation()
        presenter?.viewDidLoad()
        
 
        
    }
    


}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.pokemonCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.defaultReuseIdentifier, for: indexPath) as! PokemonTableViewCell
        
        cell.display = presenter?.getPokemon(at: indexPath.row)
        cell.imageView?.image = pokemonImages[indexPath.row]

        
        cell.setUp()
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath.row)
    }
    
    func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0 ,y: 0 ,width: newSize.width ,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.alwaysOriginal)
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension PokemonListViewController: PokemonListPresenterOutput {

    func updateUIList() {
        DispatchQueue.main.async {
            self.view.stopActivity()
            self.tableView.reloadData()
        }
    }
    

    
    func presentLoading() {
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
}

extension PokemonListViewController {
    

    
    private func setUpTableView() {
        tableView.registerNib(nibName: PokemonTableViewCell.defaultReuseIdentifier, bundle: nil)
        tableView.assignTo(delegate: self, dataSource: self)
    }
    
    private func setUpNavigation() {
        title = "Pokemon List"


    }


}



extension String {
    func capitalize() -> String {
        let arr = self.split(separator: " ").map{String($0)}
        var result = [String]()
        for element in arr {
            result.append(String(element.uppercased().first ?? " ") + element.suffix(element.count-1))
        }
        return result.joined(separator: " ")
    }
}


