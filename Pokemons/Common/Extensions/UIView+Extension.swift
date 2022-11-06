//
//
//  Pokemon Api
//
//  Created by Pokemonon 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    
    func presentActivity() {
        let activity = UIActivityIndicatorView()
        activity.backgroundColor = .activityBackground
        activity.color = .secundary
        activity.startAnimating()
        
        addSubview(activity)
        
        activity.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func stopActivity() {
        for view in subviews {
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        }
    }
}
