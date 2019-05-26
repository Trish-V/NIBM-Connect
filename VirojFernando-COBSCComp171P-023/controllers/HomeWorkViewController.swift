//
//  HomeWorkViewController.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import UIKit

class HomeWorkViewController: UIViewController {

    @IBOutlet weak var notePad: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var homeWorkTableView: UITableView!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        self.notePad.layer.cornerRadius = self.notePad.frame.height / 15
        self.blurView.layer.cornerRadius = self.blurView.frame.height / 15
        self.saveButton.layer.cornerRadius = self.saveButton.frame.height / 6
        
        
        
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
