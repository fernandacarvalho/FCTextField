//
//  ViewController.swift
//  FCTextFieldSample
//
//  Created by Fernanda FC. Carvalho on 17/05/23.
//

import UIKit
import FCTextField

class ViewController: UIViewController {

    @IBOutlet weak var example1: FCTextField!
    @IBOutlet weak var example2: FCTextField!
    @IBOutlet weak var example3: FCTextField!
    @IBOutlet weak var example4: FCTextField!
    @IBOutlet weak var example5: FCTextField!
    @IBOutlet weak var example6: FCTextField!
    @IBOutlet weak var example7: FCTextField!
    @IBOutlet weak var example8: FCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        example1.clearButtonType = .simple
        example2.clearButtonType = .rounded
        example3.clearButtonType = .outlineRounded
        example4.clearButtonType = .arrow
        example5.clearButtonType = .outlineArrow
        example6.clearButtonType = .roundCorner
        example7.clearButtonType = .squareCorner
        example8.clearButtonType = .custom
        example8.customClearButtonImage = UIImage(systemName: "arrow.clockwise")
    }

}

