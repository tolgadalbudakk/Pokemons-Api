//
//  PokemonListManager.swift
//  Pokemon Api
//
//  Created by Pedro Alvarez on 03/11/22.
//  Copyright © 2022 Mustafa Tolga Dalbudak. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: winScene)
        guard let window = self.window else {  return }
        
        PokemonListRouter().present(in: window)
        
    }
}

