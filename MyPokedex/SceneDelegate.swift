//
//  SceneDelegate.swift
//  MyPokedex
//
//  Created by Agustin Russo on 20/04/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        let homeViewController = PokemonListViewController()
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }


}

