//
//  ViewController.swift
//  Berevage
//
//  Created by Victor Kim on 2022-12-07.
//  Copyright © 2022 Dep16. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,
UITextFieldDelegate {


    @IBOutlet weak var txtSearchBar: UITextField!
    @IBOutlet weak var tableBerevages: UITableView!
    
    var berevages:[Berevage]=Array()
    var allBerevages:[Berevage]=Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data=DataLoader().beverages
        print(data[0])
        berevages=data
        
        tableBerevages.delegate=self
        tableBerevages.dataSource=self
        txtSearchBar.delegate=self
        
        allBerevages=data
        
        txtSearchBar.clearButtonMode = .always
        txtSearchBar.clearButtonMode = .whileEditing
        
        txtSearchBar.addTarget(self, action: #selector(searchRecords(_ :) ), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearchBar.resignFirstResponder()
        return true
    }
    
    @objc func searchRecords(_ textField:UITextField) {
        self.berevages.removeAll()
        if textField.text?.count != 0 {
            for berevage in allBerevages {
                if let berevageToSearch=textField.text {
                    let range=berevage.id.lowercased().range(of: berevageToSearch , options: .caseInsensitive, range: nil, locale: nil )
                    if range != nil {
                        self.berevages.append(berevage)
                    }
                }
            }
        } else {
            self.berevages=self.allBerevages
        }
        
        tableBerevages.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return berevages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCell(withIdentifier: "berevage")
        if cell==nil {
            cell=UITableViewCell(style: .default,reuseIdentifier: "berevage")
        }
        
        cell?.textLabel?.text=berevages[indexPath.row].id
        return cell!
    }

    // navigation to detailController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detVC=self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
       
        detVC.idtxt=berevages[indexPath.row].id
        detVC.berevageNametxt="name:"+berevages[indexPath.row].name
        detVC.quantitytxt="quantity:"+String(berevages[indexPath.row].num)
        detVC.categorytxt="category:"+berevages[indexPath.row].category
        detVC.producttxt="product:"+berevages[indexPath.row].product
        detVC.pricetxt="price:"+String(berevages[indexPath.row].price)
        detVC.taxetxt="taxe ?:"+String(berevages[indexPath.row].taxe)
        
        self.navigationController?.pushViewController(detVC, animated: true)
    }
    
}

