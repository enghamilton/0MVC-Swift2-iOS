//
//  EditWebservicePHP.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 04/12/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import Foundation

class EditWebservicePHP:NSObject {
    
    func editProductMySQL(fromMyUrl:String, _ name:String, _ price:String,_ description: String, completion:(String)-> Void){
        
        let url:NSURL = NSURL(string: fromMyUrl)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let paramString = "id=1&name=user01&phone=912345678&price=200.0"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) { (data, response, err) -> Void in
            let dataReceived = NSString(data: data!, encoding: NSUTF8StringEncoding)
            completion(dataReceived as! String)
            
        }
        task.resume()
    }
    
}