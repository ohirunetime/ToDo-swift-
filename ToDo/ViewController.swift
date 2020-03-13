//
//  ViewController.swift
//  ToDo
//
//  Created by 慎之助 on 2020/03/10.
//  Copyright © 2020 ohirune. All rights reserved.
//
import RealmSwift
import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var ToDOList: Results<TodoModel>!
    var sampleTableView: UITableView!
    let RealmViewInstance = try! Realm()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    func navBar(){
        let navBar = UINavigationBar()
        
        if #available(iOS 11.0, *){
            navBar.frame.origin = self.view.safeAreaLayoutGuide.layoutFrame.origin
            navBar.frame.size = CGSize(width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: 44)
        }else{
            navBar.frame.origin = self.view.safeAreaLayoutGuide.layoutFrame.origin
            navBar.frame.size = CGSize(width: self.view.frame.width, height: 44)
        }
        
        let navItem : UINavigationItem = UINavigationItem(title: "ToDo")
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose , target: self, action: #selector(AddTodo(_:)))
        navBar.pushItem(navItem, animated: true)
        view.addSubview(navBar)
    }
    
    @objc func AddTodo(_ sender: UIBarButtonItem) {
        let AddPage = AddPageController()
        self.present(AddPage,animated: true ,completion: nil)
    }
    func tableViewUI() {
        // tableviewを作成
        self.sampleTableView = UITableView()

        // iphonex 判別
        if #available(iOS 11.0, *) {
            
            sampleTableView.frame.origin = self.view.safeAreaLayoutGuide.layoutFrame.origin
            self.sampleTableView.frame = CGRect(x: 0, y: 88, width: self.view.frame.width, height: self.view.frame.height)
            print("iphone 8")
            
        }else{
            sampleTableView.frame.origin = self.view.safeAreaLayoutGuide.layoutFrame.origin
            self.sampleTableView.frame = CGRect(x: 0, y: 34, width: self.view.frame.width, height: self.view.frame.height)
            print("iphone x")
            
        }
        
        // realm database
        
        self.ToDOList = RealmViewInstance.objects(TodoModel.self)
        
        
        
        // 設定するカスタムセルを指定。
        // 今回はSampleCustomCellというクラスを参照させる。（後述）
        self.sampleTableView.register(
            SampleCustomCell.self,
            forCellReuseIdentifier: "SampleCustomCell"
        )
        self.sampleTableView.dataSource = self
        self.sampleTableView.delegate = self
        self.view.addSubview(self.sampleTableView)
    }
    
    
    
    // とりあえず、データ数を50に。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ToDOList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルのインスタンスの作成
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SampleCustomCell",
            for: indexPath as IndexPath
            ) as! SampleCustomCell
        // cellオブジェクトのプロパティのsampleLabelに値をセット。
        let todo : TodoModel = self.ToDOList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = todo.content
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //順番とviewDidLoad()の中じゃないことに注意！！！
        navBar()
        
        tableViewUI()
        
    }
    func update(){
        self.sampleTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            try! RealmViewInstance.write{
                    RealmViewInstance.delete(self.ToDOList[indexPath.row])
                    self.sampleTableView.reloadData()
                    print("削除できたよー")

                                

            }
            

        }
    }
    
    
    
    
}

