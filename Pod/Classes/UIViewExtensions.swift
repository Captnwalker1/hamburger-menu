import UIKit

extension UIView {
    
    ///Instantiate a UIView object from a nib in the NSBundle.
    class func instantiateFromNib(nibName: String) -> UIView {
        let view = UIView()
        
        let elements = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        for element in elements! {
            if let element = element as? UIView {
                return element
            }
        }
        
        return view
    }
    
    ///Constrain a subview to all the edges of its superview with one line.
    func constrainToSuperview(superview: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //align to edges of super view
        superview.addConstraint(
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: 0)
        )
        superview.addConstraint(
            NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1, constant: 0)
        )
        superview.addConstraint(
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: 0)
        )
        superview.addConstraint(
            NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1, constant: 0)
        )
        
    }
    
}
