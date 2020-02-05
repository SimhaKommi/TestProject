//
//  DecryoptionViewController.swift
//  CryptoString
//
//  Created by Lakshmi NarasimhaRao  on 04/02/20.
//  Copyright © 2020 Malinayudu. All rights reserved.
//

import UIKit
import RNCryptor

class DecryoptionViewController: UIViewController {

    @IBOutlet weak var txtDecryption: UITextField!
    @IBOutlet weak var lblDescription: UILabel!
    
    var PushData = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
          txtDecryption.text! = PushData
    }
    
    @IBAction func btnSubmitDecryption(_ sender: Any) {
        do{
            let decryoted = try self.decryptMessage(encryptedMessage: txtDecryption.text!, encryptionKey: key)
        lblDescription.text = decryoted
        }catch{
            print("error")
        }
       
    }
    
   

    func decryptMessage(encryptedMessage: String, encryptionKey: String) throws -> String {

        let encryptedData = Data.init(base64Encoded: encryptedMessage) // just data
        let decryptedData =  try! RNCryptor.decrypt(data: encryptedData!, withPassword: key)
        let decryptedString = String(data: decryptedData, encoding: .utf8)! //
        return decryptedString
    }

}
