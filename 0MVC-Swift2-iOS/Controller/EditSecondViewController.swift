//
//  EditSecondViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 29/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import CoreData

class EditSecondViewController: UIViewController {

    @IBOutlet weak var editUsername:UITextField!
    
    @IBOutlet weak var editPhone:UITextField!
    
    @IBOutlet weak var editDescription:UITextField!
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
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
        
        let labelId:Optional<String> = "1"
        let labelName:String? = "username here"
        let labelPrice:String? = "199.99"
        let labelPhone:String? = "11 91234 5678"
        let labelDescription:String? = "iOS engineer Hamilton description"
        
        let postString = "pid="+labelId!+"&name="+labelName!+"&price="+labelPrice!+"&phone="+labelPhone!+"&description="+labelDescription!
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                let dataReceived = NSString(data: urlContent, encoding: NSUTF8StringEncoding) as! String
                completion(dataReceived)
                /*
                do {
                    
                    
                } catch {
                    print("JSON serialization failed \(error)")
                    
                }
                */
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
            
            let alertEdit = UIAlertController(title: "Insert values CoreData", message: "Insert Users info", preferredStyle: UIAlertControllerStyle.Alert)
            
            let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: { (saveUIAlertAction)-> Void  in
                
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(cancelAlertAction)-> Void in
                
            })
            
            alertEdit.addTextFieldWithConfigurationHandler { (myUITextField) -> Void in
                //do something
            }
            
            alertEdit.addAction(saveAction)
            
            alertEdit.addAction(cancelAction)
            
            self.presentViewController(alertEdit, animated: true, completion: {
                ()-> Void in
                // do nothing
            })
            
        }
    }
    
    @IBAction func homeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    

}
