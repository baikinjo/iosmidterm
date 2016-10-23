//
//  ViewController.swift
//  actinosheetexample
//
//  Created by Injo Baik on 2016-10-22.
//  Copyright © 2016 Injo Baik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareActionSheet(_ sender: AnyObject) {
        let actionSheet : UIAlertController = UIAlertController(title: "Log In", message: "How do you want to Log in?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title:"Facebook", style: UIAlertActionStyle.default, handler:{ action in print("Facebook Selected")}))
        actionSheet.addAction(UIAlertAction(title:"Google+", style: UIAlertActionStyle.default, handler:{ action in print("Google+ Selected")}))
        actionSheet.addAction(UIAlertAction(title:"Twitter", style: UIAlertActionStyle.default, handler:{ action in print("Twitter Selected")}))
        actionSheet.addAction(UIAlertAction(title:"Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        present(actionSheet, animated: true, completion:nil)


    }
}
