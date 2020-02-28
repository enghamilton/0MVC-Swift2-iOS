//
//  ThirdViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 27/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit
import CoreData

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    //var managedObjContext: NSManagedObjectContext!
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https:/ /jamesonquave.com/blog/core-data-in-swift-tutorial-part-1/
        //let newItem = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: self.managedObjContext) as! Product
        
        //let entityDescription = NSEntityDescription.entityForName("Product", inManagedObjectContext: self.managedObjContext)
        
        //let newProductItem = NSManagedObject(entity: entityDescription, insertIntoManagedObjectContext: NSManagedObjectContext.assignObject(self.managedObjContext))
        //newProductItem.setValue("user 01", forKey:"name")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPHPMySQL(sender: AnyObject) {
        let myAlert = UIAlertView(title: "iOS RESTful", message: "PHP MySQL", delegate: nil, cancelButtonTitle: "cancelar")
        myAlert.show()
        
    }
    
    @IBAction func buttonJavaPostgreSQL(sender: AnyObject) {
        /*
        let myAlert = UIAlertView(title: "iOS RESTful", message: "from REST database http://javarestjson.herokuapp.com/api/produtos", delegate: nil, cancelButtonTitle: "cancelar")
        myAlert.show()
        */
        
        let loadWebservice = Webservice()
        loadWebservice.loadProductsFromMySQL("https://javarestjson.herokuapp.com/api/produtos"){
            (myDisplay)-> Void in
            
            let myAlert = UIAlertView(title: "iOS RESTful", message: "from REST database http://javarestjson.herokuapp.com/api/produtos \( myDisplay )", delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
            
        }
        
    }
    
    @IBAction func buttonDotNetPostgreSQL(sender: AnyObject) {
       
        let loadWebservice = Webservice()
        loadWebservice.loadProductsFromMySQL("https://rest-csharp.herokuapp.com/api/values/5"){
            (myDisplay)-> Void in
            
            let myAlert = UIAlertView(title: "iOS RESTful", message: "from REST  https://rest-csharp.herokuapp.com/api/values/5 \( myDisplay )", delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
            
        }
        
    }
    
    @IBAction func buttonNodeJS(sender: AnyObject) {
        /*
        let loadWebservice = Webservice()
        loadWebservice.loadProductsFromMySQL("https://nodejs-ios-android.herokuapp.com"){
            (myDisplay)-> Void in
            
            let myAlert = UIAlertView(title: "iOS RESTful", message: "from REST  https://nodejs-ios-android.herokuapp.com \( myDisplay )", delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
            
        }
        */
        let alertEnterCoreData = UIAlertController(title: "Insert values CoreData", message: "Insert Users info", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: { (saveUIAlertAction)-> Void  in
            
            // https:/ /jamesonquave.com/blog/core-data-in-swift-tutorial-part-1/
            //let newItem = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: self.managedObjContext) as! Product
            
            let entityObj =
            NSEntityDescription.entityForName("Product",
                inManagedObjectContext: self.managedObjContext)
            let newItem = Product(entity: entityObj!,
                insertIntoManagedObjectContext: self.managedObjContext)
            
            newItem.id = 1
            newItem.name = "user 01"
            newItem.itemDescription = "first description"
            newItem.price = "200.00"
            
            /*
            do{
                try newItem.managedObjectContext?.save()
            } catch {
                
            }
            */
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(cancelAlertAction)-> Void in
            
        })
        
        alertEnterCoreData.addTextFieldWithConfigurationHandler { (myUITextField) -> Void in
            //do something
        }
        
        alertEnterCoreData.addAction(saveAction)
        
        alertEnterCoreData.addAction(cancelAction)
        
        presentViewController(alertEnterCoreData, animated: true, completion: {
            ()-> Void in
            // do nothing
        })
        
    }
    
    
    @IBAction func backSecondView(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
