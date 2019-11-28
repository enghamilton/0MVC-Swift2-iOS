//
//  SecondViewController.swift
//  0MVC-Swift2-iOS
//
//  Created by macOS on 25/11/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondMainView: UIView!
    
    @IBOutlet weak var backHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.navigationItem.rightBarButtonItem = barItemLoad
        /*
        let rightButton = UIBarButtonItem(title: "MVC Main TableView", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("simpleDisplayAlert:"))
        self.navigationItem.rightBarButtonItem = rightButton
        */
        //navigationController?.popViewControllerAnimated(true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func backMainView(sender: AnyObject) {
    
    }

    @IBAction func homeButton(sender: AnyObject) {
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
