//
//  forgotPwVC.swift
//  BFriend
//
//  Created by admin on 07/09/23.
//

import UIKit

class forgotPwVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coVi.layer.cornerRadius = 25
        coVi.layer.masksToBounds = true
        emailStack.layer.cornerRadius = 30
        emailStack.layer.masksToBounds = true
       
    }
    
    @IBOutlet weak var coVi: UIView!
    
    @IBOutlet weak var emailStack: UIStackView!
    
    
   

   
   

}
