//
//  CreateAccountViewController.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var retypePassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if( userName.text == "" || password.text == ""){
            showAlert("Problem!", "Check again", "Ok")
            return
        }
        
        
        let emailRegexExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let regexEmail = NSPredicate(format:"SELF MATCHES %@", emailRegexExp)
        
        if (!regexEmail.evaluate(with: userName.text) ){
            showAlert("Problem!", "Check email", "Ok")
            return
        }
        
        
        let pwRegexExp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\\s).{4,8}$"
        let regexPw = NSPredicate(format:"SELF MATCHES %@", pwRegexExp)
        
        if (!regexPw.evaluate(with: password.text ) ){
            showAlert("Problem!", "Check password", "Ok")
            return
        }
        
        if ((password.text?.elementsEqual(retypePassword.text!))! != true){
            showAlert("Problem!", "Password dosen't match", "Ok")
            return
        }
        
        
        Auth.auth().createUser(withEmail: self.userName.text! , password: self.password.text! ) { authResult, error in
            if (error != nil){
                
                self.showAlert("Problem!", "Pleas check your credentials and try again", "Ok")
                
                return
                
            }
            
            self.performSegue(withIdentifier: "backSegue", sender:nil)
            
        }
        
        
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
        //        self.performSegue(withIdentifier: "backSegue", sender: self )
    }
    
    func showAlert(_ title : String, _ msg : String , _ button : String) {
        let alertController = UIAlertController(title: title,
                                                message: msg,
                                                preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: button, style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
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
