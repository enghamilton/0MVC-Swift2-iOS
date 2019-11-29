//
//  Webservice.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 28/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class Webservice: NSObject {
    
    func loadProductsFromMySQL(fromMyUrl:String, completion:(String)-> Void){
        
        //let url = NSURL(string: "https:/ /javarestjson.herokuapp.com/api/produtos")
        let url = NSURL(string: fromMyUrl)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                do {
                    
                    let dataString:String? = String(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    
                    completion(dataString!)
                    /*
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)

                    let dict: NSDictionary? = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    
                    completion(jsonResult as! String)
                    */
                    
                } catch {
                    print("JSON serialization failed \(error)")
                    
                }
                
            } else {
               
            }
        }
        
        task.resume()
        
    }

}
