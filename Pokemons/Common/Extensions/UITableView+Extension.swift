//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit

extension UITableView {
    
    func assignTo(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func registerNib(nibName: String, bundle: Bundle?) {
        let nib = UINib(nibName: nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: nibName)
    }
}
