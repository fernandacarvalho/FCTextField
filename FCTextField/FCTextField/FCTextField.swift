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
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    
    //MARK: SETUPS
    
    fileprivate func initView() {
        self.borderStyle = .none
        self.layer.borderWidth = 0
        self.bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1 , width: self.frame.size.width, height: 1)
        self.bottomLine.backgroundColor = self.bottomLineColor
        self.addSubview(self.bottomLine)
        self.configureEvents()
    }
    
    fileprivate func configureEvents() {
        addTarget(self, action: #selector(self.didBeginEditing), for: .editingDidBegin)
    }
    
    //MARK: HANDLERS
    @objc fileprivate func didBeginEditing() {
        self.hideBottomLine()
    }
    
    //MARK: ANIMATIONS
    fileprivate func hideBottomLine() {
        UIView.animate(withDuration: 0.8, animations: {
            self.bottomLine.frame.size.width = 0
            self.bottomLine.center.x = self.frame.width/2
        }) { (true) in
            self.bottomLine.isHidden = true
            self.showBottomLine()
        }
    }
    
    fileprivate func showBottomLine() {
        UIView.animate(withDuration: 0.8, animations: {
            self.bottomLine.center.x = 0
            self.bottomLine.frame.size.width = self.frame.size.width
            self.bottomLine.isHidden = false
        }) { (true) in
            self.changeToActiveColor()
        }
    }
    
    fileprivate func changeToActiveColor() {
        UIView.animate(withDuration: 0.8, animations: {
            self.bottomLine.backgroundColor = .purple
        })
    }
}
