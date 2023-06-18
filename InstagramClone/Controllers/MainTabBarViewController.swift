//
//  MainTabBarViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // MARK: - Set tab bar items

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ExploreViewController())
        let vc3 = UINavigationController(rootViewController: CameraViewController())
        let vc4 = UINavigationController(rootViewController: NotificationsViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())

        vc1.title = "Home"
        vc2.title = "Explore"
        vc3.title = "Camera"
        vc4.title = "Notifications"
        vc5.title = "Profile"

        tabBar.tintColor = .label

        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
}
