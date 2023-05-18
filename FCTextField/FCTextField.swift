//
//  FCTextField.swift
//  FCTextField
//
//  Created by Fernanda FC. Carvalho on 17/05/23.
//

import UIKit

//Enum to define how Clear Button should appear
public enum ClearButtonType {
    case iosDefault //native Clear Button icon
    case simple
    case rounded
    case outlineRounded
    case arrow
    case outlineArrow
    case roundCorner
    case squareCorner
    case custom //user provides the image
}

@IBDesignable
public class FCTextField: UITextField {
    
    fileprivate var bottomLine = UIView()
    fileprivate var tintedClearImage: UIImage?

    //Type of Clear Button if it is visible
    open var clearButtonType : ClearButtonType = .iosDefault
    
    //Image for Clear Button if the type is .custom
    open var customClearButtonImage : UIImage?
    
    //Value for alpha of Clear Button
    @IBInspectable open var clearButtonAlpha : CGFloat = 0.5
    
    //Value for color of Clear Button
    @IBInspectable open var clearButtonColor : UIColor = .lightGray

    //The color of the line in the bottom
    @IBInspectable open var bottomDefaultColor : UIColor = .lightGray {
        didSet {
            self.bottomLine.backgroundColor = self.bottomDefaultColor
        }
    }
    //The color of the line in the bottom when the text field is the first responder
    @IBInspectable open var bottomActiveColor : UIColor = .darkGray
    
    //The color of placeholder
    @IBInspectable open var placeholderColor : UIColor = .lightGray {
        didSet {
            self.customizePlaceholder()
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
        self.backgroundColor = .clear
        self.customizeBorder()
        self.configureEvents()
    }
    
    fileprivate func configureEvents() {
        addTarget(self, action: #selector(self.didBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(self.didEndEditing), for: .editingDidEnd)
    }
    
    fileprivate func customizePlaceholder() {
        self.attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor:placeholderColor])
    }
    
    fileprivate func customizeBorder() {
        self.borderStyle = .none
        self.layer.borderWidth = 0
        
        self.bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1 , width: self.frame.size.width, height: 1)
        self.bottomLine.backgroundColor = self.bottomDefaultColor
        self.addSubview(self.bottomLine)
    }
    
    fileprivate func customizeClearButton() {
        if clearButtonMode != .never {
            for view in self.subviews {
                if view is UIButton {
                    let button = view as! UIButton
                    
                    switch self.clearButtonType {
                    case .iosDefault:
                        if let image = button.image(for: .highlighted) {
                            if self.tintedClearImage == nil {
                                tintedClearImage = image.withTintColor(self.clearButtonColor)
                            }
                            button.setImage(self.tintedClearImage, for: .normal)
                            button.setImage(self.tintedClearImage, for: .highlighted)
                            break
                        }
                    case .arrow:
                        if let image = UIImage(named: "arrowClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                            self.setImageToClearButton(image: image, button: button)
                            break
                        }
                    case .outlineArrow:
                    if let image = UIImage(named: "outlineArrowClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .rounded:
                    if let image = UIImage(named: "roundedClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .outlineRounded:
                    if let image = UIImage(named: "outlineRoundedClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .roundCorner:
                    if let image = UIImage(named: "roundCornerClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .squareCorner:
                    if let image = UIImage(named: "squaredClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .simple:
                    if let image = UIImage(named: "simpleClearButton", in: BundleUtil.bundle, compatibleWith: nil)?.withTintColor(self.clearButtonColor) {
                        self.setImageToClearButton(image: image, button: button)
                        break
                    }
                    case .custom:
                        if let image = self.customClearButtonImage {
                            self.setImageToClearButton(image: image, button: button)
                            break
                        } else {
                            self.clearButtonType = .iosDefault
                            self.customizeClearButton()
                        }
                    }
                }
            }
        }
    }
    
    fileprivate func setImageToClearButton(image: UIImage, button: UIButton) {
        let alphaImage = image.alpha(self.clearButtonAlpha)
        if self.tintedClearImage == nil {
            tintedClearImage = alphaImage.withTintColor(self.clearButtonColor)
        }
        button.setImage(self.tintedClearImage, for: .normal)
        button.setImage(self.tintedClearImage, for: .highlighted)
    }
    
    //MARK: HANDLERS
    @objc fileprivate func didBeginEditing() {
        self.hideBottomLine()
    }
    
    @objc fileprivate func didEndEditing() {
        self.backToDefaultColor()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if self.isFirstResponder {
            self.customizeClearButton()
        }
    }
    
    
    //MARK: ANIMATIONS
    fileprivate func hideBottomLine() {
        UIView.animate(withDuration: 0.4, animations: {
            self.bottomLine.frame.size.width = 0
            self.bottomLine.center.x = self.frame.width/2
        }) { (true) in
            self.bottomLine.isHidden = true
            self.showBottomLine()
        }
    }
    
    fileprivate func showBottomLine() {
        UIView.animate(withDuration: 0.4, animations: {
            self.bottomLine.center.x = 0
            self.bottomLine.frame.size.width = self.frame.size.width
            self.bottomLine.isHidden = false
        }) { (true) in
            self.changeToActiveColor()
        }
    }
    
    fileprivate func changeToActiveColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bottomLine.backgroundColor = self.bottomActiveColor
        })
    }
    
    fileprivate func backToDefaultColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.bottomLine.backgroundColor = self.bottomDefaultColor
        })
    }
}


