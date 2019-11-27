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
        for index in 1...1 {
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
        if self.myArray.count == 0 {
            return 1
        } else {
            return self.myArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if self.myArray.count == 0 {
            let cell = self.TableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! MyCustomCell
            
            cell.myCellLabel.text = "please load from database"
            
            return cell
        } else {
            //let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: IndexPath) as! MyCustomCell
            let cell = self.TableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! MyCustomCell
            
            cell.myCellLabel.text = self.myArray[indexPath.row]
            
            return cell
        }
    }
    
    @IBAction func loadMySQL(sender: AnyObject) {
        //simpleDisplayAlert()
        loadProductsFromMySQL { (textForAlert) -> Void in
            let myAlert = UIAlertView(title: "iOS RESTful", message: textForAlert, delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
        }
        /*
        for index in 1...10 {
            self.myArray.append("user \( index )")
        }
        self.TableView.reloadData()
        */
    }
    
    func loadProductsFromMySQL(completion:(String)-> Void){
        
        //let url = NSURL(string: "http: //heyhttp.org/me.json")
        let url = NSURL(string: "http://pizzaria2.000webhostapp.com/android_connect/get_all_products.php")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            let dataString:String? = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
            var tmpArrayResponseString = dataString!.componentsSeparatedByString("<html>")
            let responseString:String? = tmpArrayResponseString[0]
            completion(responseString!)
            
            if let urlContent = data {
                
                do {
                    
                    let jsonGetString = String(data: urlContent, encoding: NSUTF8StringEncoding)
                    //let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    //let text = jsonResult as? String
                    //completion(jsonGetString!)
                    
                } catch {
                    print("JSON serialization failed \(error)")
                    
                }
                
            } else {
                /*
                let myJSONDefault:String? = "{'id'=1, 'name'='username 01', 'price'='19.99', 'description'='hamilton put a description here'}"
                completion(myJSONDefault!)
                */
            }
        }
        task.resume()
        
        
        /*
        let dataString = String(data: dataJson, encoding: NSUTF8StringEncoding)//Swift 2.2
        //let dataString = String(data: dataJson, encoding: .utf8) //swift 3.0
        //var tmpArrayResponseString = split(datastring) {$0 == "<html>"}
        var tmpArrayResponseString = dataString!.componentsSeparatedByString("<html>")
        let responseString:String = tmpArrayResponseString[0]
        
        let alert = UIAlertView(title: "iOS REST Json", message: responseString, delegate: nil, cancelButtonTitle: "cancel")
        alert.show()
        
        
        let dataFromJSONString = responseString.dataUsingEncoding(NSUTF8StringEncoding)
        let dictionary:NSDictionary = NSKeyedUnarchiver.unarchiveObjectWithData(dataFromJSONString!) as! NSDictionary
        
        for var j=0 ; j < (dictionary.valueForKey("Products") as! NSArray).count ; j++ {
            arrDictId.addObject(dictionary.valueForKey("pid") as! NSArray)
            arrDictName.addObject(dictionary.valueForKey("name") as! NSArray)
            arrDictPrice.addObject(dictionary.valueForKey("price") as! NSArray)
        */
        
        
        
    }
    
    func simpleDisplayAlert(){
        loadProductsFromMySQL(){
            (textDisplay) -> Void in
            let myAlert = UIAlertView(title: "iOS RESTful", message: textDisplay, delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
        }
    }

}