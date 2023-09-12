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
        contVie.layer.cornerRadius = 20
        contVie.layer.masksToBounds = true
        googleBtn.layer.cornerRadius = 25
        emailStack.layer.masksToBounds = true
        emailStack.layer.cornerRadius = 30
        emailss.layer.masksToBounds = true
        emailss.layer.cornerRadius = 30
        pwStack.layer.masksToBounds = true
        pwStack.layer.cornerRadius = 30
        googleBtn.layer.masksToBounds = true
       
        fbBtn.layer.cornerRadius = 25
        fbBtn.layer.masksToBounds = true
       
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor(red: 0.373, green: 0.588, blue: 0.992, alpha: 1)]

        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.purple]
        

           let attributedString1 = NSMutableAttributedString(string:"By Checking the box you agree to the ", attributes:attrs1)

           let attributedString2 = NSMutableAttributedString(string:"Terms & Conditions and Privacy Policy", attributes:attrs2)

           attributedString1.append(attributedString2)
           self.ppLbl.attributedText = attributedString1

       
        

    }

    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailStack: UIStackView!
    
    @IBOutlet weak var pwStack: UIStackView!
    @IBOutlet weak var emailss: UIStackView!
    @IBOutlet weak var ppLbl: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    
    
    
    @IBOutlet weak var fbBtn: UIButton!
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
          // ...
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
 
    
 
    
    @IBAction func LoBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    
    
    func CreateUser(){
        Auth.auth().createUser(withEmail: emailTxt.text ?? "", password: pwTxt.text ?? "") { authResult, error in
          // ...
        }
    }
    
  
    @IBOutlet weak var pwTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var contVie: UIView!
    
    @IBAction func signUpBtn(_ sender: Any) {
        CreateUser()
    }
    func validation(){
        if pwTxt.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please provide your Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }else if emailTxt.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please Provide your Email Adress", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else if nameTxt.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Please Provide your name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPwVc") as! ResetPwVc
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
}
