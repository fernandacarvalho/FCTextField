//
//  ViewController.swift
//  FCTextFieldExample
//
//  Created by Fernanda Carvalho on 12/02/20.
//  Copyright © 2020 FernandaCarvalho. All rights reserved.
//

import UIKit
import FCTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: FCTextField!
    @IBOutlet weak var passwordTxt: FCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //HOW TO STYLE PROGRAMATICALLY:
        //self.emailTxt.bottomActiveColor = yourColor
        //self.emailTxt.bottomDefaultColor = yourColor
        //self.emailTxt.placeholderColor = yourColor
        
        //HOW TO STYLE CLEAR BUTTON:
        let alpha : CGFloat = 0.5
        let type = ClearButtonType.custom
        self.emailTxt.clearButtonAlpha = alpha
        self.emailTxt.clearButtonType = type
        self.passwordTxt.clearButtonAlpha = alpha
        self.passwordTxt.clearButtonType = type
        
        //CUSTOM IMAGE EXAMPLE
        let image = UIImage(named: "outlineRoundedClearButton")
        self.emailTxt.customClearButtonImage = image
        self.passwordTxt.customClearButtonImage = image
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

