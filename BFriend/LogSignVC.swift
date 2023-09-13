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
     
        signupView.layer.cornerRadius = 23
        signupView.layer.masksToBounds = true
        loginView.layer.cornerRadius = 23
        loginView.layer.masksToBounds = true
        
        
    }
    
 
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var signupView: UIView!
   
    @IBAction func singBtn(_ sender: Any) {
    }
    
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
 
}
