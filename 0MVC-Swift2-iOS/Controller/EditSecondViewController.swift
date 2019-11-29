//
//  EditSecondViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 29/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class EditSecondViewController: UIViewController {

    @IBOutlet weak var editUsername:UITextField!
    
    @IBOutlet weak var editPhone:UITextField!
    
    @IBOutlet weak var editDescription:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editProductsFromMySQL(completion:(String)-> Void){
        
        //let url = NSURL(string: "http: //heyhttp.org/me.json")
        let url = NSURL(string: "http://pizzaria2.000webhostapp.com/android_connect/edit_product_details.php")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        let labelId:String? = "1"
        let labelName:String? = "username here"
        let labelPrice:String? = "199.99"
        let labelPhone:String? = "11 91234 5678"
        let labelDescription:String? = "iOS engineer Hamilton description"
        
        let postString = "pid="+labelId!+"&name="+labelName!+"&price="+labelPrice!+"&description="+labelDescription!
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                do {
                    
                    
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
        
    }
    
    
    @IBAction func buttonEditSaveMySQL(sender: AnyObject){
        editProductsFromMySQL(){
            (buttonEditPressed)-> Void in
            
        }
    }
    
    @IBAction func homeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    

}
