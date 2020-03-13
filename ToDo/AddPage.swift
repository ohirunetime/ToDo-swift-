//
//  AddPage.swift
//  ToDo
//
//  Created by 慎之助 on 2020/03/11.
//  Copyright © 2020 ohirune. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AddPageController : UIViewController{
    let textFiled = UITextField()
    let AddButton = UIButton()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        AddPageUI()

    }
    
    func AddPageUI(){
        view.backgroundColor = UIColor.white
        textFiled.frame = CGRect(x:((self.view.bounds.width-320)/2),y:100,width:320,height:40)
        textFiled.borderStyle = .roundedRect
        textFiled.placeholder="something here"
        
        AddButton.setTitle("追加", for: .normal)
        AddButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        AddButton.frame = CGRect(x:((self.view.bounds.width-100)/2),y:180,width:100,height:40)
        AddButton.layer.borderWidth  = 1.0
        AddButton.layer.borderColor = UIColor(red: 0.3, green: 0.6, blue: 0.5, alpha: 1).cgColor
        AddButton.layer.shadowOpacity = 0.5
        AddButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        AddButton.addTarget(self, action: #selector(AddPageController.AddToDO(_:)), for: .touchUpInside)
        
        view.addSubview(textFiled)
        view.addSubview(AddButton)
        
    }
    @objc func AddToDO(_ sender: UIButton) {
        
        let InstanceTodoModel :TodoModel = TodoModel()
        InstanceTodoModel.content = self.textFiled.text
        let RealmAddToDoInstance = try! Realm()
        try! RealmAddToDoInstance.write{
            RealmAddToDoInstance.add(InstanceTodoModel)
            print("sucess!")
            print(Realm.Configuration.defaultConfiguration.fileURL!)
        }
        
        let parentVC = self.presentingViewController as! ViewController
        parentVC.update()
        
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
   
    
}
