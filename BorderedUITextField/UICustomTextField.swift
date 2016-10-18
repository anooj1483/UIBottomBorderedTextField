//
//  Created by Anooj Krishnan G
//

import UIKit


class UIBottomBorderedTextField: UITextField {
    
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    @IBInspectable var paddingBottom: CGFloat = 0
    
    @IBInspectable var leftImage: UIImage    =   UIImage();
    @IBInspectable var x_Image: CGFloat   =  0;
    @IBInspectable var y_Image: CGFloat   =  0;
    @IBInspectable var imageHeight: CGFloat   =  10;
    @IBInspectable var imageWidth: CGFloat   =  10;
    
    
    let padding = UIEdgeInsets(top: 0, left: 2, bottom: 2, right: 2);
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override func awakeFromNib() {
        customize()
    }
    
    override func prepareForInterfaceBuilder() {
        customize();
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect:CGRect = CGRect(x: bounds.origin.x + paddingLeft, y: bounds.origin.y,
                          width: bounds.size.width - paddingLeft - paddingRight, height: bounds.size.height);

        return UIEdgeInsetsInsetRect(rect, padding);
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    func customize(){
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame =   CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height);
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true;
        self.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: x_Image, y: y_Image, width: imageHeight, height: imageWidth));
        imageView.image = leftImage
        self.leftView = imageView

    }

}
