//
//  StudentInfoTableViewCell.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import Foundation

import UIKit

class StudentInfoTableViewCell : UITableViewCell {

    @IBOutlet weak var dpView: UIImageView!
    @IBOutlet weak var first_name: UILabel!
    @IBOutlet weak var last_name: UILabel!
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var blurBackground: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.blurBackground.layer.cornerRadius = blurBackground.frame.height / 5
        self.dpView.layer.cornerRadius = dpView.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         
    }
}
