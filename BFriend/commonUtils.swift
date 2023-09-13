//
//  commonUtils.swift
//  BFriend
//
//  Created by admin on 13/09/23.
//

import Foundation
import UIKit
//class utils : UIAlertController{
//      func showAlert(message: String) {
//    let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "", style: .default)
//    let cancelAction = UIAlertAction(title: "", style: .cancel)
//    alertController.addAction(okAction)
//    alertController.addAction(cancelAction)
//    self.present(alertController, animated: true)
//    }
    class UtilityClass {

       static func showAlertControllerWith(title:String, message:String?, onVc:UIViewController , style: UIAlertController.Style = .alert, buttons:[String], completion:((Bool,Int)->Void)?) -> Void {

           let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
           for (index,title) in buttons.enumerated() {
               let action = UIAlertAction.init(title: title, style: UIAlertAction.Style.default) { (action) in
                   completion?(true,index)
               }
               alertController.addAction(action)
           }

           onVc.present(alertController, animated: true, completion: nil)
       }

   

}
