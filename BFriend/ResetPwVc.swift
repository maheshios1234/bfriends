//
//  ResetPwVc.swift
//  BFriend
//
//  Created by admin on 07/09/23.
//

import UIKit

class ResetPwVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pwStack.layer.cornerRadius = 30
        pwStack.layer.masksToBounds = true
        conStack.layer.cornerRadius = 30
        conStack.layer.masksToBounds = true
        coView.layer.cornerRadius = 30
        coView.layer.masksToBounds = true
    }
    
    @IBOutlet weak var pwStack: UIStackView!
    
    @IBOutlet weak var conStack: UIStackView!
    @IBOutlet weak var coView: UIView!
}
