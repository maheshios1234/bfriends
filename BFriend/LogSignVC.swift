//
//  LogSignVC.swift
//  BFriend
//
//  Created by admin on 06/09/23.
//

import UIKit

class LogSignVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        signupV.layer.cornerRadius = 23
        signupV.layer.masksToBounds = true
        loginV.layer.cornerRadius = 23
        loginV.layer.masksToBounds = true
        
        
    }
    
 
    
    @IBOutlet weak var signupV: UIView!
    @IBOutlet weak var loginV: UIView!
    @IBOutlet weak var signBtn: UIButton!
    
    @IBAction func signUpBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
        self.navigationController?.isNavigationBarHidden = true
       
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        self.navigationController?.isNavigationBarHidden = true

    }
 
    
    //    @IBAction func loginBtn(_ sender: Any) {
//        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
   
    
  

}
