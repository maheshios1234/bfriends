//
//  SignupVC.swift
//  BFriend
//
//  Created by admin on 06/09/23.
//

import UIKit
import FirebaseAuth

class SignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        googleBtn.layer.cornerRadius = 25
        nameStack.layer.masksToBounds = true
        nameStack.layer.cornerRadius = 30
        emailstack.layer.masksToBounds = true
        emailstack.layer.cornerRadius = 30
        pwStack.layer.masksToBounds = true
        pwStack.layer.cornerRadius = 30
        googleBtn.layer.masksToBounds = true
       
        fbBtn.layer.cornerRadius = 25
        fbBtn.layer.masksToBounds = true
        pwTxt.borderStyle = .none
        emailTxt.borderStyle = .none
        nameTxt.text = .none
       
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor(red: 0.373, green: 0.588, blue: 0.992, alpha: 1)]

        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.purple]
        

           let attributedString1 = NSMutableAttributedString(string:"By Checking the box you agree to the ", attributes:attrs1)

           let attributedString2 = NSMutableAttributedString(string:"Terms & Conditions and Privacy Policy", attributes:attrs2)

           attributedString1.append(attributedString2)
           self.ppLbl.attributedText = attributedString1

       
        

    }
   
  
    @IBOutlet weak var nameTxt: UITextField!
  
    @IBOutlet weak var emailTxt: UITextField!
    
  
    @IBOutlet weak var pwTxt: UITextField!
    
  
    @IBOutlet weak var nameStack: UIStackView!
    @IBOutlet weak var pwStack: UIStackView!
    @IBOutlet weak var emailstack: UIStackView!
    @IBOutlet weak var ppLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var googleBtn: UIButton!
    
    
    
    @IBOutlet weak var fbBtn: UIButton!

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func LoginBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
 
    

    
    @IBAction func signUpBtn(_ sender: Any) {
        Auth.auth().createUser(withEmail: (emailTxt.text ?? ""), password: (pwTxt.text ?? "")) { (result, error) in
                    if let _eror = error {
                        //something bad happning
                        print(_eror.localizedDescription )
                        UtilityClass.showAlertControllerWith(title: "Error", message: "\(String(describing: error?.localizedDescription))", onVc: self, buttons: ["OK"]) {
                            (succes, index) in
//                            if index == 0 { // ok button tapped
//
//                            }
                        }
                    }else{
                        //user registered successfully
                        UtilityClass.showAlertControllerWith(title: "Error", message: "\(String(describing: result))", onVc: self, buttons: ["OK"]) { (succes, index) in
                           
                        }
                    }
                 }
    }
    
    
}
