//
//  ViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 07/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
//import Foundation
import CoreBluetooth
import CoreData
/*
protocol ViewControllerProtocol: class {
    func segueWithValues()
}
*/

class ViewController: UIViewController, UITableViewDataSource {
    
    var myArray:[String] = []
   
    var arrDict :NSMutableArray=[]
    var arrDictId:NSMutableArray = []
    var arrDictName:NSMutableArray = []
    var arrDictPrice:NSMutableArray = []
    
    let cellReuseIdentifier = "myCell"
    
    let webService = Webservice()
    
    var centralmanager = CBCentralManager()
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    //weak var delegateItems: ViewControllerProtocol!
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.dataSource = self
        /*
        for index in 1...1 {
            self.myArray.append("user \( index )")
        }
        */

        //self.centralmanager = CBCentralManager(delegate: self, queue: nil)
        
        let entityDescription = NSEntityDescription.entityForName("Product", inManagedObjectContext: self.context)
        
        let newProductItem = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.context)
        
        //newProductItem.setValue("user 01", forKey:"name")
        
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
            
            var tmpArrayJSON = responseString!.componentsSeparatedByString("(")
            let resultStringWithJson:String? = tmpArrayJSON[1]
            
            //completion(resultStringWithJson!)
            //until here it works fine !
            
            let resultData = resultStringWithJson!.dataUsingEncoding(NSUTF8StringEncoding)
            
            do {
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(resultData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                 // stackoverflow.com/questions/24764755/swift-how-to-loop-through-nsdictionary
                let dataArray = jsonResult["products"] as! NSArray;
                
                print("Data items count: \(dataArray.count)")
                
                for item in dataArray { // loop through data items
                    let obj = item as! NSDictionary
                    for (key, value) in obj {
                        print("Property: \"\(key as! String)\"")
                        if key as! String == "name" {
                            self.arrDictName.addObject(value)
                        }
                    }
                }
                
                completion("arrDicName array with values are \(self.arrDictName.description)")
                
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(error.localizedDescription)
            }
            
            //https:/ /stackoverflow.com/questions/30480672/how-to-convert-a-json-string-to-a-dictionary
            /*
            func convertStringToDictionary(text: String) -> [String:AnyObject]? {
                if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
                    do {
                        return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
                    } catch let error as NSError {
                        print(error)
                    }
                }
                return nil
            }
            
            let str = "{\"name\":\"James\"}"
            
            let result = convertStringToDictionary(str)
            */
            
            //
            // begin : try to test from here
            /*
            
            let resultStringWithJson2 = resultStringWithJson! as NSString
            resultStringWithJson2.stringByReplacingOccurrencesOfString("{\"", withString: "{\\\"")
            resultStringWithJson2.stringByReplacingOccurrencesOfString(":\"", withString: ":\\\"")
            let text:String? = resultStringWithJson2 as String
            text?.dataUsingEncoding(NSUTF8StringEncoding)
            
            let dataFromJSONString = resultStringWithJson!.dataUsingEncoding(NSUTF8StringEncoding)
            let dictionary:NSDictionary = NSKeyedUnarchiver.unarchiveObjectWithData(dataFromJSONString!) as! NSDictionary
            
            for var j=0 ; j < (dictionary.valueForKey("Products") as! NSArray).count ; j++ {
                
                self.arrDictId.addObject(dictionary.valueForKey("pid") as! NSMutableArray)
                self.arrDictName.addObject(dictionary.valueForKey("name") as! NSMutableArray)
                self.arrDictPrice.addObject(dictionary.valueForKey("price") as! NSMutableArray)
                
            }
            
            if let swiftArray = self.arrDictName as NSArray as? [String]{
                completion(swiftArray[0] ?? "something went wrong")
            }
            */
            //
            // ends : try to test ending
            
            //completion(resultStringWithJson!)
            
            if let urlContent = data {
                
                do {
                    
                    //let jsonGetString = String(data: urlContent, encoding: NSUTF8StringEncoding)
                    /*
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    for var j=0 ; j < (jsonResult.valueForKey("Products") as! NSArray).count ; j++ {

                    }
                    */
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