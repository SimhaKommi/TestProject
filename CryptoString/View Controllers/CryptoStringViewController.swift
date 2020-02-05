//
//  CryptoStringViewController.swift
//  CryptoString
//
//  Created by Lakshmi NarasimhaRao on 04/02/20.
//  Copyright © 2020 Malinayudu. All rights reserved.
//

import UIKit

class CryptoStringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnENCRYPT(_ sender: UIButton) {
    
    let vc = storyboard?.instantiateViewController(withIdentifier: "EncryptionViewController") as! EncryptionViewController
    
    navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
    @IBAction func btnDECRYPT(_ sender: Any) {
    
    let vc = storyboard?.instantiateViewController(withIdentifier: "DecryoptionViewController") as! DecryoptionViewController

    navigationController?.pushViewController(vc, animated: true)
    }
}
