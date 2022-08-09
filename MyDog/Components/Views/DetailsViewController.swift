//
//  DetailsViewController.swift
//  MyDog
//
//  Created by Estefania Sassone on 07/08/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var dogImg: UIImageView!
    @IBOutlet weak var nameDog: UILabel!
    @IBOutlet weak var descriptionDog: UILabel!
    @IBOutlet weak var ageDog: UILabel!
    @IBOutlet weak var cardDetails: UIView!
    
    var dog: Dog?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        cardDetails.layer.cornerRadius = 40
        cardDetails.layer.borderWidth = 2
        cardDetails.layer.borderColor = UIColor(named: "#666666")?.cgColor
        dogImg.layer.cornerRadius = 15
        
        nameDog.text = dog?.dogName
        descriptionDog.text = dog?.description
        ageDog.text = String("Almost \(dog!.age) years")
        dogImg.loadFrom(url: dog!.image)
    }

}
