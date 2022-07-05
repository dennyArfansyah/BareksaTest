//
//  SceneDelegate.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel(caller: vc)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }

}
