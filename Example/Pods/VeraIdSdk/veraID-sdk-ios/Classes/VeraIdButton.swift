//
//  VeraIdButton.swift
//  VeraIdSdk
//
//  Created by Shukhrat Sagatov on 21.06.2020.
//

import Foundation

@IBDesignable
public class VeraIdButton: UIButton {
    
    var diagonalMode:    Bool = false { didSet { updatePoint()} }
    var shadowRadius:    CGFloat = 0.0 { didSet { updateShadow() } }
    var shadowOpacity:   Float = 0.0 { didSet { updateShadow()} }
    var shadowColor:     UIColor = .white {didSet {updateShadow()} }
    var shadowOffset:    CGSize = CGSize(width: 1, height: 1) { didSet { updateShadow() } }
    @IBInspectable var cornerRadius:    Int = 8 { didSet { updateShadow() } }
    var startColor:   UIColor = .black { didSet { updateColors() }}
    var endColor:     UIColor = .white { didSet { updateColors() }}
    var startLocation: Double =   0.05 { didSet { updateLocations() }}
    var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    var horizontalMode:  Bool =  false { didSet { updatePoint() }}
    
    public override class var layerClass: AnyClass{ return CAGradientLayer.self}
    
    var gradientLayer: CAGradientLayer{ return layer as! CAGradientLayer}
    func updatePoint() {
        
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    
    func updateShadow(){
        gradientLayer.cornerRadius = CGFloat(cornerRadius)
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOpacity = shadowOpacity
        gradientLayer.shadowOffset = CGSize(width: 1, height: 1)
        gradientLayer.shadowRadius = shadowRadius
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updatePoint()
        updateLocations()
        updateColors()
        updateShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.diagonalMode = false
        self.horizontalMode = true
        
        self.startColor = .brightLightBlue
        self.endColor = .blurple
        let title = "VERA ID"
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.kern: 1.5, NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)])
        self.setAttributedTitle(attributedTitle, for: .normal)
    }
    
}

extension UIColor {
    @nonobjc class var blurple: UIColor {
        return UIColor(red: 106.0 / 255.0, green: 66.0 / 255.0, blue: 213.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var brightLightBlue: UIColor {
        return UIColor(red: 47.0 / 255.0, green: 204.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
}
