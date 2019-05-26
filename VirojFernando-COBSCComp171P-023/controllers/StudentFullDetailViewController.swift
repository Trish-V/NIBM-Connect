//
//  StudentFullDetailViewController.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import UIKit

class StudentFullDetailViewController: UIViewController {
    
    var student_model : StudentModel? = nil
    
    @IBOutlet weak var dpImage: UIImageView!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var fb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dpImage.layer.cornerRadius = dpImage.frame.width / 2
 
        if (student_model != nil){
            
            firstName.text = self.student_model?.first_name
            
            lastName.text = self.student_model?.last_name
            
            city.text = self.student_model?.city
            
            phone.text = self.student_model?.phone_number
            
            fb.text = self.student_model?.fb_profile_url
            
            dpImage!.kf.setImage(with: URL(string: self.student_model!.picture_url))
            
        }
        
        
        
        
    }
    
    
    @IBAction func backAction(_ sender: Any) { self.dismiss(animated: true, completion: nil)
           performSegue(withIdentifier: "goBackToList", sender: nil)
       
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
