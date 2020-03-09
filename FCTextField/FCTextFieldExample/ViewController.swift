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
    
    
    @IBOutlet weak var example1: FCTextField!
    @IBOutlet weak var example2: FCTextField!
    @IBOutlet weak var example3: FCTextField!
    @IBOutlet weak var example4: FCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //HOW TO STYLE PROGRAMATICALLY:
        //self.emailTxt.bottomActiveColor = yourColor
        //self.emailTxt.bottomDefaultColor = yourColor
        //self.emailTxt.placeholderColor = yourColor
        
        //HOW TO STYLE CLEAR BUTTON:
        let alpha : CGFloat = 0.5
        self.example1.clearButtonAlpha = alpha
        
        //CUSTOM IMAGE EXAMPLE
        self.example1.clearButtonType = ClearButtonType.custom
        let image = UIImage(named: "customImageExample")
        self.example1.customClearButtonImage = image
        
        
        //PRE-DEFINED CLEAR BUTTON TYPE EXAMPLE
        self.example2.clearButtonType = .outlineRounded
        self.example2.clearButtonAlpha = 0.8
        
        self.example3.clearButtonType = .arrow
        
        self.example4.clearButtonAlpha = 0.6
        self.example4.clearButtonType = .roundCorner
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

