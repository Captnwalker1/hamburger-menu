//
//  DefaultMenu.swift
//  Pods
//
//  Created by Tanner Nelson on 1/16/16.
//
//

import Foundation

@available(iOS 9 , *)
class DefaultMenuView: MenuView {
    
    override init(rootView: UIView, controller: MenuController) {
        super.init(rootView: rootView, controller: controller)
        
        self.backgroundColor = UIColor.white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //align to edges of super view
        self.addConstraint(
            NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        )
        self.addConstraint(
            NSLayoutConstraint(item: stackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        )
       
        self.addConstraint(
            NSLayoutConstraint(item: stackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        )
        
        if let items = controller.tabBar.items {
            for (index, item) in items.enumerated() {
                let button = UIButton()
                
                button.contentHorizontalAlignment = .left
                button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
                
                button.setTitleColor(controller.view.tintColor, for: .normal)
                button.setTitle(item.title, for: .normal)
                button.tag = index
                button.addTarget(self, action: #selector(DefaultMenuView.buttonTap), for: .touchUpInside)
                stackView.addArrangedSubview(button)
                
            }
        }
        
    }
    
    @objc func buttonTap(sender: UIButton) {
        self.switchToTab(tab: sender.tag, andClose: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
