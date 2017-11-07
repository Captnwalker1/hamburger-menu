/*

    Replaces the native UIView inside of the UITabBarController subclass.

    This is necessary to ensure proper capture of touch events for the
    hamburger menu added outside of the UIView's bounds.

*/

import Foundation

class MenuControllerView: UIView {
    
    //MARK: Properties
    var menu: MenuView!
    
    //MARK: Touch
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if self.bounds.contains(point) {
            return true
        }
    
        //allow touches to pass to the Menu
        if self.menu.frame.contains(point) {
            return true
        }
        
        return false
    }
    
}
