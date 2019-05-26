//
//  StudentModal.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import Foundation
class StudentModel {
    
    var first_name : String
    
    var last_name : String
    
    var city : String
    
    var picture_url : String
    
    var phone_number : String
    
    var fb_profile_url : String
    
    
    init( first_name : String ,last_name : String, city : String , picture_url : String, phone_number : String, fb_profile_url : String ) {
        self.first_name = first_name
        self.last_name = last_name
        self.city = city
        self.picture_url = picture_url
        self.phone_number = phone_number
        self.fb_profile_url = fb_profile_url
        
    }
  
    
}
