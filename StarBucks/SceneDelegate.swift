//
//  SceneDelegate.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        let secondVC = UINavigationController(rootViewController: PayViewController())
        let thirdVC = UINavigationController(rootViewController: OrderViewController())
        let forthVC = UINavigationController(rootViewController: ShopViewController())
        let fifthVC = UINavigationController(rootViewController: OtherViewController())

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVC, secondVC, thirdVC, forthVC, fifthVC], animated: true)
        tabBarController.tabBar.backgroundColor = UIColor.systemGray3
        
        UITabBar.appearance().tintColor = UIColor(red: 36 / 256, green: 192 / 256, blue: 132 / 256, alpha: 1)
        
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "house.fill")
            items[0].image = UIImage(systemName: "house")
            items[0].title = "Home"
            
            items[1].selectedImage = UIImage(systemName: "creditcard.fill")
            items[1].image = UIImage(systemName: "creditcard")
            items[1].title = "Home"
            
            items[2].selectedImage = UIImage(systemName: "dollarsign.circle.fill")
            items[2].image = UIImage(systemName: "dollarsign.circle")
            items[2].title = "Home"
            
            items[3].selectedImage = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
            items[3].image = UIImage(systemName: "takeoutbag.and.cup.and.straw")
            items[3].title = "Home"
            
//            items[4].selectedImage = UIImage(systemName: "ellipsis")
            items[4].image = UIImage(systemName: "ellipsis")
            items[4].title = "Home"
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

