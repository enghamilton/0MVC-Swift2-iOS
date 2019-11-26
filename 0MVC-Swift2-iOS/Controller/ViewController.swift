//
//  ViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 07/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource {
    
    var myArray:[String] = []
    
    let cellReuseIdentifier = "myCell"
    
    let webService = Webservice()
    
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.dataSource = self
        for index in 1...20 {
            self.myArray.append("user \( index )")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return self.myArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: IndexPath) as! MyCustomCell
        let cell = self.TableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! MyCustomCell
        
        cell.myCellLabel.text = self.myArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func loadMySQL(sender: AnyObject) {
        simpleDisplayAlert()
        
    }
    
    func loadProductsFromMySQL(completion:(String)-> Void){
        let nameDisplay:String? = "{id=1, name=user 01, price=20.20, description= hamilton first description goes here}"
        completion(nameDisplay!)
    }
    
    func simpleDisplayAlert(){
        loadProductsFromMySQL(){
            (textDisplay) -> Void in
            let myAlert = UIAlertView(title: "iOS RESTful", message: textDisplay, delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
        }
    }

}