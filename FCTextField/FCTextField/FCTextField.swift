//
//  FCTextField.swift
//  FCTextField
//
//  Created by Fernanda Carvalho on 12/02/20.
//  Copyright © 2020 FernandaCarvalho. All rights reserved.
//

import UIKit

public class FCTextField: UITextField {
    
    fileprivate var bottomLine = UIView()
    
    open var bottomLineColor : UIColor = .black {
        didSet {
            self.bottomLine.backgroundColor = self.bottomLineColor
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func initView() {
        self.borderStyle = .none
        self.layer.borderWidth = 0
        self.bottomLine.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1)
        self.bottomLine.backgroundColor = self.bottomLineColor
        self.addSubview(self.bottomLine)
    }
    
}
