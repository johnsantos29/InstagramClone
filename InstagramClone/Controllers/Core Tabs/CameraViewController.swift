//
//  CameraViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import AVFoundation
import UIKit

final class CameraViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func didTapTakePicture() {}
}
