//
//  ViewController.swift
//  MyDog
//
//  Created by Estefania Sassone on 11/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startButton(_ sender: Any) {
        _ = APIClient.loadDogs().done { dogs in
            let homeVC = HomeTableViewController()
            homeVC.dogsData = dogs
            let home = UINavigationController(rootViewController: homeVC)
            home.modalPresentationStyle = .fullScreen
            self.present(home, animated: true)
        }
    }
    
}

