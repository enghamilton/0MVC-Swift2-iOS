//
//  FirstViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 27/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var firstView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    
    @IBAction func buttonPHPMySQL(sender: AnyObject) {
        let myAlert = UIAlertView(title: "iOS RESTful", message: "PHP MySQL", delegate: nil, cancelButtonTitle: "cancelar")
        myAlert.show()
    }
    
    
    @IBAction func buttonJavaPostgreSQL(sender: AnyObject) {
        let instanceOfJavaBackEnd = Webservice()
        instanceOfJavaBackEnd.loadProductsFromMySQL("https://javarestjson.herokuapp.com/api/produtos"){
            (myDisplay)-> Void in
            
            let myAlert = UIAlertView(title: "iOS RESTful", message: "java spring MVC JPA PostgreSQL from REST database http://javarestjson.herokuapp.com/api/produtos \( myDisplay )", delegate: nil, cancelButtonTitle: "cancelar")
            myAlert.show()
            
        }

    }
    
    
    @IBAction func buttonDotNetJSON(sender: AnyObject) {
        let myAlert = UIAlertView(title: "iOS RESTful", message: "C# .NET Core 3.0 MVC JSON", delegate: nil, cancelButtonTitle: "cancelar")
        myAlert.show()
    }
    
    

}
