//
//  DetailViewController.swift
//  Berevage
//
//  Created by Victor Kim on 2022-12-09.
//  Copyright © 2022 Dep16. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DetailidLabel: UILabel!
    
    @IBOutlet weak var berevageName: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var product: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var taxe: UITextField!
    
    var idtxt=""
    var berevageNametxt=""
    var quantitytxt=""
    var categorytxt=""
    var producttxt=""
    var pricetxt=""
    var taxetxt=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailidLabel.text=idtxt
        berevageName.text=berevageNametxt
        quantity.text=quantitytxt
        category.text=categorytxt
        product.text=producttxt
        price.text=pricetxt
        taxe.text=taxetxt
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
