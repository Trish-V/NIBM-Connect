//
//  LoginViewController.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/25/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var createAccountView: UIVisualEffectView!
    @IBOutlet weak var blurBackground: UIVisualEffectView!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var resetPassword: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logInButton.layer.cornerRadius = self.logInButton.frame.height / 4
        
        self.blurBackground.alpha = 0
        
        self.createAccountView.alpha = 0
        self.resetPassword.alpha = 0
        
        self.blurBackground.layer.cornerRadius = self.blurBackground.frame.height / 10
        
        self.createAccountView.layer.cornerRadius = self.createAccountView.frame.height / 8
        self.resetPassword.layer.cornerRadius = self.resetPassword.frame.height / 8
        
        self.animateControls()
        
    }
    
    @IBAction func logInClicked(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text! ) { [weak self] user, error in
            guard self != nil else { return }
            
            if (error != nil){
                
                let alertController = UIAlertController(title: "Problem!",
                                                        message: "Pleas check your credentials and try again",
                                                        preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                self?.present(alertController, animated: true, completion: nil)
                
                return
                
            }
            
            self!.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
    }
    
    func animateControls (  )  {
        UIView.animate(withDuration: 0.2, delay: 1, options: .curveLinear, animations: {
            
            self.blurBackground.alpha = 1
            self.resetPassword.alpha = 1
            
            self.createAccountView.alpha = 1
            
        })
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
