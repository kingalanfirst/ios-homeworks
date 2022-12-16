//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Alan on 03.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента пользователя"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "chart.bar.doc.horizontal"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }
    
    func createProfileViewController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        profileViewController.title = "Профиль пользователя"
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 1)
        return UINavigationController(rootViewController: profileViewController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray6
        tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
        return tabBarController
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = createTabBarController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

