//
//  Webservice.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 07/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import Foundation

class WebservicePHP:NSObject {
    
    
    func loadProductsFromMySQL(fromMyUrl:String, completion:(String)-> Void){
        
        let url = NSURL(string: fromMyUrl)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                do {
                    
                    let dataString:String? = String(NSString(data: urlContent, encoding: NSUTF8StringEncoding))
                    var tmpArrayResponseString = dataString!.componentsSeparatedByString("<html>")
                    let responseString:String? = tmpArrayResponseString[0]
                    
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
    
    func someFunctionWithClosure(a:String,and b :String, handler: (Int,Int)->Void){
        
    }
    //someFunctionWithClosure("a","b"){(num1,num2)->Void in }
}

extension Webservice {
    
}