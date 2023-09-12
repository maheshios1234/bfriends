//
//  LoginViewController.swift
//  BFriend
//
//  Created by admin on 06/09/23.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        contVw.layer.cornerRadius = 25
        contVw.layer.masksToBounds = true
        emailStack.layer.cornerRadius = 30
        emailStack.layer.masksToBounds = true
       
        fbBtn.layer.cornerRadius = 25
        fbBtn.layer.masksToBounds = true
        googleBtn.layer.cornerRadius = 25
        googleBtn.layer.masksToBounds = true
        pwStack.layer.cornerRadius = 30
        pwStack.layer.masksToBounds = true

    }
   
    @IBOutlet weak var pwText: UITextField!
    @IBOutlet weak var googleBtn: UIButton!
    
  
    
    @IBAction func forgotBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "forgotPwVC") as! forgotPwVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func googleAc(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }

            // If sign in succeeded, display the app's main content View.
          }
    }
    
    @IBAction func fbAc(_ sender: Any) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) -> Void in
              if (error == nil){
                  let fbloginresult : LoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                        return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                  self.getFBUserData()
                }
              }
            }
    }
    func getFBUserData(){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completion: { (connection, result, error) -> Void in
            if (error == nil){
              //everything works print the user data
              print(result)
            }
          })
        }
      }
   
    @IBOutlet weak var fbBtn: UIButton!
    

    
    @IBOutlet weak var pwStack: UIStackView!
    
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var emailStack: UIStackView!
    @IBOutlet weak var contVw: UIView!
    @IBOutlet weak var pwTxt: UITextField!
    @IBAction func loginBtn(_ sender: Any) {
     txtValidate()
    }
    func existingUser(){
        Auth.auth().signIn(withEmail: emailTxt.text ?? "", password: pwTxt.text ?? "") { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }
    }
    func txtValidate(){
        if emailTxt.text == "abc@gmail.com" && pwTxt.text == "1234"{
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OtpVc") as! OtpVc
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }else if emailTxt.text == "" || pwTxt.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Empty Fields", preferredStyle: .alert)
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
            }
        
        else{
            let alert = UIAlertController(title: "Alert", message: "Wrong EmailAdress or Password", preferredStyle: .alert)
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
        }
    }
    
    

}
