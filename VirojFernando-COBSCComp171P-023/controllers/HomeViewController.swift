//
//  HomeViewController.swift
//  VirojFernando-COBSCComp171P-023
//
//  Created by Viroj Fernando on 5/26/19.
//  Copyright © 2019 Heaven'sCode. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class HomeViewController: UIViewController  , UITableViewDataSource , UITableViewDelegate{
    
    
    @IBOutlet weak var studentListTableView: UITableView!
    
    let url = URL(string: "https://picsum.photos/200/400/?random")
    
    
    var studentModel : [StudentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use Firebase library to configure APIs 
        
        self.studentListTableView.delegate = self
        
        self.studentListTableView.dataSource = self
        
        //        studentListTableView.tableFooterView = UIView()
        
        let usersRef = Database.database().reference()
        
        
        
        usersRef.child("users/") .observe(.value, with: { snapshot in
            
            for snapshotValue in snapshot.children.allObjects as! [DataSnapshot] {
                
                let student = snapshotValue.value as! NSDictionary
                
                let firstName  =  student[ "first_name" ]
                
                let lastName =   student[  "last_name"  ]
                
                let city =   student[  "city"  ]
                
                let picture_url =  student[  "picture_url"  ]
                
                let phone_number =   student[  "phone_number"  ]
                
                let fbProfile =   student[   "fb_profile_url"  ]
                
                let studentModalItem = StudentModel(first_name: firstName as! String,
                                                    last_name: lastName as! String,
                                                    city:city as! String ,
                                                    picture_url: picture_url as! String ,
                                                    phone_number: phone_number as! String,
                                                    fb_profile_url: fbProfile as! String)
                
                
                self.studentModel.append(  studentModalItem)
                
                self.studentListTableView.reloadData() 
                
                
            }
            
            
            
            
            
            self.studentListTableView.reloadData()
            
            
            
            
            
        })
        
        /*    usersRef.observe(.childAdded, with: { (snapshot) -> Void in
         
         let studentModalItem = StudentModel(first_name: snapshot.value(forKeyPath: "first_name") as! String,
         last_name: snapshot.value(forKeyPath: "last_name") as! String,
         city: snapshot.value(forKeyPath: "city") as! String,
         picture_url: snapshot.value(forKeyPath: "picture_url") as! String,
         phone_number: snapshot.value(forKeyPath: "phone_number") as! String,
         fb_profile_url: snapshot.value(forKeyPath: "fb_profile_url") as! String)
         
         
         self.studentModel.append(  studentModalItem)
         
         })
         */
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentInfoTableViewCell", for: indexPath) as! StudentInfoTableViewCell
        cell.first_name.text = self.studentModel[indexPath.row].first_name
        cell.last_name.text = self.studentModel[indexPath.row].last_name
        cell.city.text = self.studentModel[indexPath.row].city
        cell.dpView!.kf.setImage(with: URL(string: self.studentModel[indexPath.row].picture_url ) )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 130.0
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         print(  studentModel[indexPath.row].first_name )
        performSegue(withIdentifier: "student_detail", sender: studentModel[indexPath.row])
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "student_detail"
        {
            if let viewController = segue.destination as? StudentFullDetailViewController{
                
                viewController.student_model = sender as? StudentModel
            }
        }
    }
}
