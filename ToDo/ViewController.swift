//
//  ViewController.swift
//  ToDo
//
//  Created by 慎之助 on 2020/03/10.
//  Copyright © 2020 ohirune. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {
    

//    var ItemList : Results<TodoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        // Do any additional setup after loading the view.
    }
    
    private func setUI(){
        let bottomBar = UIView(frame: CGRect(x: 0, y: self.view.frame.height-50, width: self.view.frame.width, height: 50))
        bottomBar.backgroundColor=UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        let button = UIButton(frame:CGRect(x: 0, y: 0, width: 80, height: 30))
        button.backgroundColor=UIColor(red: 0.25, green: 0.60, blue: 0.75, alpha: 1.0)
        
        button.setTitle("submit", for: .normal)
        button.titleLabel?.font=UIFont(name: "Futura", size: 14)
        button.setTitleColor(UIColor.white,for: .normal)
        button.layer.cornerRadius = 5.0;
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width * 0.7, height: 30))
        textField.borderStyle = .roundedRect
        
        button.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomBar)
        bottomBar.addSubview(textField)
        bottomBar.addSubview(button)
        
        
        let bottomBarWidth = NSLayoutConstraint(
            item: bottomBar,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: self.view.frame.size.width
          )

          let bottomBarLeading = NSLayoutConstraint(
            item: bottomBar,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0
          )

          let bottomBarTrailing = NSLayoutConstraint(
            item: bottomBar,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0
          )

          let bottomBarHeight = NSLayoutConstraint(
            item: bottomBar,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 50
          )


          let bottomBarConstraintBottom = NSLayoutConstraint(
            item: bottomBar,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0
          )

          //******* textField Constraints *******

          // Set Center Y to textField
          let textFieldCenterY = NSLayoutConstraint(
            item: textField,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: bottomBar,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0
          )

          let textFieldWidth = NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: textField.frame.size.width * 0.8
          )

          let textFieldHeight = NSLayoutConstraint(
            item: textField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: textField.frame.size.height
          )

          let textFieldLeading = NSLayoutConstraint(
            item: textField,
            attribute: .leading,
            relatedBy: .equal,
            toItem: bottomBar,
            attribute: .leading,
            multiplier: 1.0,
            constant: 20
          )





         //******* Button Constraints *******

         // Set Center Y to bottoBar
         let buttonCenterY = NSLayoutConstraint(
            item: button,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: bottomBar,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0
         )

         let buttonWidth = NSLayoutConstraint(
            item: button,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: button.frame.size.width
         )

         let buttonHeight = NSLayoutConstraint(
            item: button,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: button.frame.size.height
         )


         let buttonLeading = NSLayoutConstraint(
            item: button,
            attribute: .leading,
            relatedBy: .equal,
            toItem: textField,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 20
         )


        // Add Constraints
        bottomBar.addConstraints([ buttonLeading, buttonWidth, buttonHeight, buttonCenterY])
        bottomBar.addConstraints([textFieldCenterY, textFieldHeight, textFieldWidth,textFieldLeading])
        self.view.addConstraints([bottomBarConstraintBottom, bottomBarWidth, bottomBarHeight, bottomBarLeading, bottomBarTrailing])

         
    }
    


}

