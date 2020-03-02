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
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

