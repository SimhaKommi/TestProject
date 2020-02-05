//
//  EncryptionViewController.swift
//  CryptoString
//
//  Created by Lakshmi NarasimhaRao on 04/02/20.
//  Copyright © 2020 Malinayudu. All rights reserved.
//

import UIKit
import RNCryptor

let key = "Narasimha"
class EncryptionViewController: UIViewController {
    
    @IBOutlet weak var txtEncrypt: UITextField!
    @IBOutlet weak var lblEncryption: UILabel!
    @IBOutlet weak var btnSUBMIT: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //  self.btnSUBMIT.alpha = 0.5
        
    }
    
    @IBAction func btnSubmitEncrypt(_ sender: Any) {
        
        do {
            let EncryptionData = try self.encryptMessage(message: txtEncrypt.text!, encryptionKey: key)
            lblEncryption.text = EncryptionData
            //passing data
            let vc = storyboard?.instantiateViewController(withIdentifier: "DecryoptionViewController") as! DecryoptionViewController
            vc.PushData = lblEncryption.text!
            navigationController?.pushViewController(vc, animated: true)
            print(EncryptionData)
        } catch  {
            print("Error")
        }
        self.view.endEditing(true)
        
    }
    
    
    func encryptMessage(message: String, encryptionKey: String) throws -> String {
        let messageData = message.data(using: .utf8)!
        let cipherData =  RNCryptor.encrypt(data: messageData, withPassword: key)
        let Encryptedstring: String = cipherData.base64EncodedString()
        return Encryptedstring
    }
   
    
    
}
//
extension EncryptionViewController: UITextFieldDelegate {
//
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate  = text.replacingCharacters(in: range, with: string)
          //  self.callMyMethod(txtAfterUpdate)
            do{
            let EncryptionData = try self.encryptMessage(message: txtAfterUpdate, encryptionKey: key)
            print(EncryptionData)
            }
            catch{
                print("error")
            }
        }
        return true
    }

    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.btnSUBMIT.alpha = 1
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.btnSUBMIT.alpha = 1
//    }
}
