//
//  ChatMessageView.swift
//  FW Mobile
//
//  Created by Austin Jackson on 10/14/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit

class ChatMessageView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Initialization
    
    var rating = 0
    var ratingButtons = [UIButton]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        
        button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
        
        ratingButtons += [button]
        
        addSubview(button)
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 300, height: 65.5)
    }
    
    override func layoutSubviews() {
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        
    }
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
