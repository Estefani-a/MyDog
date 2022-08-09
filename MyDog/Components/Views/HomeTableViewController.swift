//
//  HomeTableViewController.swift
//  MyDog
//
//  Created by Estefania Sassone on 07/08/2022.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let cellIdentifier = "HomeCell"
    
    var dogsData: [Dog] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.title = "My Dog"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "BACK", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "#666666")
        self.navigationItem.leftBarButtonItem?.image = UIImage(systemName: "chevron.backward")
        
        self.clearsSelectionOnViewWillAppear = false

        let nib = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
    }
    @objc func back(){
        dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard dogsData.count > indexPath.row else { return }
        let dog = dogsData[indexPath.row]
        let detailsVC = DetailsViewController()
        detailsVC.dog = dog
        navigationController?.pushViewController(detailsVC, animated: true)    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard dogsData.count > indexPath.row,
              let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }

        let dog = dogsData[indexPath.row]
        
        cell.lblName.text = dog.dogName
        cell.lblDescription.text = dog.description
        cell.lblAge.text = String("Almost \(dog.age) years")
        cell.imgDog.loadFrom(url: dog.image)
        
        return cell
    }
    
}
