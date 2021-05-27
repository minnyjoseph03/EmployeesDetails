//
//  popUpViewController.swift
//  Machine_Test
//
//  Created by Nixon on 25/05/21.
//

import UIKit
import Kingfisher

class popUpViewController: UIViewController {
    var imagUser : URL!
    var name: String!
    @IBOutlet weak var userImagePop: UIImageView!
    @IBOutlet weak var uerNamePop: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userImagePop.kf.setImage(with: imagUser)
        uerNamePop.text = name
    }
    

    

}
