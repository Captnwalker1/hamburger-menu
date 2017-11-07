/*
    The main Menu view.

    Subclass this view and create a nib that 
    uses the subclass you created.

    Import this nib into your MenuController
    in the Storyboard under "Menu Nib"
*/

import UIKit

open class MenuView: UIView {
    
    //MARK: Properties
    var rootView: UIView!
    var width: CGFloat!
    var open = false
    
    ///The HamburgerMenuController this menu is attached to
    public var controller: MenuController!
   
    public init(rootView: UIView, controller: MenuController) {
        self.init()
        
        self.initialize(rootView: rootView, controller: controller)
    }
    
    open func initialize(rootView: UIView, controller: MenuController) {
        //calculate a nice width for the menu
        var width = rootView.frame.size.width - 85
        if width > 400 {
            width = 400
        }
        
        //initialize
        self.width = width
        self.rootView = rootView
        self.controller = controller
        
        //add the menu to the rootView and constrain it to hang off the left side
        self.rootView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //align to edges of super view
        self.rootView.addConstraint(
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.rootView, attribute: .top, multiplier: 1, constant: 0)
        )
        self.rootView.addConstraint(
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.rootView, attribute: .leading, multiplier: 1, constant: 0)
        )
        self.rootView.addConstraint(
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.rootView, attribute: .bottom, multiplier: 1, constant: 0)
        )
        self.rootView.addConstraint(
            NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: self.width)
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func switchToTab(tab: Int, andClose shouldClose: Bool) {
        self.controller.selectedIndex = tab
        
        if self.open && shouldClose {
            self.toggle(animated: true)
        }
    }
    
    ///Open and close the menu and transition all HamburgerButtons. Animation is optional.
    public func toggle(animated: Bool) {
        self.open = !self.open
        
        for button in self.controller.buttons {
            if self.open {
                button.transitionToHamburger(animated: false)
                button.transitionToX(animated: animated)
            } else {
                button.transitionToX(animated: false)
                button.transitionToHamburger(animated: animated)
            }
        }
        
        if animated {
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: {
                self.toggleTransform()
            }, completion: nil)
        } else {
            self.toggleTransform()
        }
    }
    
    func toggleTransform() {
        //calculate whether to open or close the menu
        let left: CGFloat
        if self.open {
            left = self.width
        } else {
            left = 0
        }
        
        self.rootView.transform = CGAffineTransform(translationX: left, y: 0)
    }
}
