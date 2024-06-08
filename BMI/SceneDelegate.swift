//
//  SceneDelegate.swift
//  BMI
//
//  Created by Sergey Zakurakin on 07/06/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CalculateViewController()
        window?.makeKeyAndVisible()
    }

}

