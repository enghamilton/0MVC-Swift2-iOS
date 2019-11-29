//
//  ThirdViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 27/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
