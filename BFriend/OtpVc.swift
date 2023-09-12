//
//  OtpVc.swift
//  BFriend
//
//  Created by admin on 06/09/23.
//

import UIKit

class OtpVc: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        first.delegate = self
//        sec.delegate = self
//        third.delegate = self
//        fourth.delegate = self
        
        
//        first.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
//        sec.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
//        third.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
//        fourth.addTarget(self, action:#selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       // first.becomeFirstResponder()
    }
    
    
    @IBAction func submitBtn(_ sender: Any) {
        otpVerify()
    }

    @IBOutlet weak var first: UITextField!
    
    
    @IBOutlet weak var sec: UITextField!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var fourth: UITextField!
    
 
    @IBOutlet weak var wrongLbl: UILabel!
    @objc func textDidChange(textField: UITextField){

        let text = textField.text

//        if text?.utf16.count == 1{
//            switch textField{
//            case first:
//                sec.becomeFirstResponder()
//            case sec:
//                third.becomeFirstResponder()
//            case third:
//                fourth.becomeFirstResponder()
//            case fourth:
//                fourth.resignFirstResponder()
//            default:
//                break
//            }
//        }else{
//
//        }
    }
    func textFieldDidBeginEditing(textField: UITextField) {
           textField.text = ""
       }
    func otpVerify(){
        if (first.text == "1" && sec.text == "2" && third.text == "3" && fourth.text == "4"){
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResetPwVc") as! ResetPwVc
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
        
        else {
           
                let alert = UIAlertController(title: "Alert", message: "Wrong otp", preferredStyle: .alert)
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
