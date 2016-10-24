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
    @IBAction func changeAction(_ sender: AnyObject) {
        let actionSheet : UIAlertController = UIAlertController(title: "CHANGE Background?", message: "CHOOSE", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title:"Red", style: UIAlertActionStyle.default, handler:{ action in self.view.backgroundColor = UIColor.red}))
        actionSheet.addAction(UIAlertAction(title:"BLUE", style: UIAlertActionStyle.default, handler:{ action in self.view.backgroundColor = UIColor.blue}))
        actionSheet.addAction(UIAlertAction(title:"green", style: UIAlertActionStyle.default, handler:{ action in self.view.backgroundColor = UIColor.green}))
        actionSheet.addAction(UIAlertAction(title:"nah i like default", style: UIAlertActionStyle.default, handler:{ action in self.view.backgroundColor = UIColor.white}))
        actionSheet.addAction(UIAlertAction(title:"Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        present(actionSheet, animated: true, completion:nil)
        
    }
    

    @IBAction func shareActionSheet(_ sender: AnyObject) {
        let actionSheet : UIAlertController = UIAlertController(title: "Log In", message: "How do you want to Log in?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        func signupHandler(actionTarget: UIAlertAction){
            let controller = UIAlertController(title: "Registration", message: "Create a new account", preferredStyle: .alert)
            
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "username"})
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "email"})
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "password";
                textField.isSecureTextEntry = true})
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "confirm password";
                textField.isSecureTextEntry = true})
            
            let signup = UIAlertAction(title: "Sign Up", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            controller.addAction(signup)
            controller.addAction(cancel)
            
            present(controller, animated: true, completion: nil)
        }
        
        func loginHandler(actionTarget: UIAlertAction){
            let controller = UIAlertController(title: "Login", message: "Enter username and password", preferredStyle: .alert)
            
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "username"})
            
            controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "password";
                textField.isSecureTextEntry = true})
            
            let login = UIAlertAction(title: "Login", style: .default, handler: nil)
            let forgot = UIAlertAction(title: "Forgot Password", style: .default, handler: nil)
            let signup = UIAlertAction(title: "Sign Up", style: .default, handler: signupHandler)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            controller.addAction(login)
            controller.addAction(forgot)
            controller.addAction(signup)
            controller.addAction(cancel)
            
            present(controller, animated: true, completion: nil)
        }
        
        actionSheet.addAction(UIAlertAction(title:"Facebook", style: UIAlertActionStyle.default, handler:loginHandler))
        actionSheet.addAction(UIAlertAction(title:"Google+", style: UIAlertActionStyle.default, handler:loginHandler))
        actionSheet.addAction(UIAlertAction(title:"Twitter", style: UIAlertActionStyle.default, handler:loginHandler))
        actionSheet.addAction(UIAlertAction(title:"Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        present(actionSheet, animated: true, completion:nil)
        

    }

    
    @IBAction func defaultButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Default Style", message: "the default alert view style", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        controller.addAction(ok)
        controller.addAction(cancel)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func inputButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Input Fields", message: "Insecure and secure text fields", preferredStyle: .alert)
        
        controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "insecure field";})
        
        controller.addTextField(configurationHandler: {(textField : UITextField) -> Void in textField.placeholder = "secure field";
            textField.isSecureTextEntry = true})
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        controller.addAction(ok)
        controller.addAction(cancel)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func desButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Destructive Action", message: "Launch nuclear missles?", preferredStyle: .alert)
        
        let launch = UIAlertAction(title: "Launch", style: .destructive, handler: nil)
        let other = UIAlertAction(title: "Launch something else", style: .default, handler: nil)
        let abort = UIAlertAction(title: "Abort", style: .cancel, handler: nil)
        
        controller.addAction(launch)
        controller.addAction(other)
        controller.addAction(abort)
        
        present(controller, animated: false, completion: nil)
    }
    @IBAction func chooseButtonPressed(_ sender: AnyObject) {
        let controller = UIAlertController(title: "You are lost in a forest", message: "The path ahead forks in two directions", preferredStyle: .alert)
        
        func leftHandler(actionTarget: UIAlertAction) {
            var controller = UIAlertController()
            
            if (getRandomNumber(range: 2)%2 == 0){
                controller = UIAlertController(title: "You stepped into a bear trap.", message: "You struggle but the hungry bear gets what the hungry bear wants.", preferredStyle: .alert)
                
                let giveup = UIAlertAction(title: "Bad ending...", style: .destructive, handler: nil)

                controller.addAction(giveup)
            } else {
                controller = UIAlertController(title: "You turned left.", message: "The path ahead forks in two directions", preferredStyle: .alert)
                
                let left = UIAlertAction(title: "Go left", style: .default, handler: leftHandler)
                let right = UIAlertAction(title: "Go right", style: .default, handler: rightHandler)
                let giveup = UIAlertAction(title: "Give up", style: .destructive, handler: giveupHandler)
                
                controller.addAction(left)
                controller.addAction(right)
                controller.addAction(giveup)
            }
            
            present(controller, animated: false, completion: nil)
        }
        
        func rightHandler(actionTarget: UIAlertAction) {
            var controller = UIAlertController()
            
            if (getRandomNumber(range: 2)%2 == 0){
                controller = UIAlertController(title: "You ate a poisonous mushroom.", message: "You think you are now a tree and try your hardest to make everything oak-kay.", preferredStyle: .alert)
                
                let giveup = UIAlertAction(title: "Bad ending...", style: .destructive, handler: nil)
                
                controller.addAction(giveup)
            } else {
                controller = UIAlertController(title: "You turned right.", message: "The path ahead forks in two directions", preferredStyle: .alert)
                
                let left = UIAlertAction(title: "Go left", style: .default, handler: leftHandler)
                let right = UIAlertAction(title: "Go right", style: .default, handler: rightHandler)
                let giveup = UIAlertAction(title: "Give up", style: .destructive, handler: giveupHandler)
                
                controller.addAction(left)
                controller.addAction(right)
                controller.addAction(giveup)
            }
            
            present(controller, animated: false, completion: nil)
        }
        
        func giveupHandler(actionTarget: UIAlertAction) {
            let controller = UIAlertController(title: "You gave up trying to leave the forest.", message: "You build a house. You were lost but now you live here. You have severely improved your predicament.", preferredStyle: .alert)
            
            let end = UIAlertAction(title: "The End", style: .cancel, handler: nil)
            
            controller.addAction(end)
            
            present(controller, animated: false, completion: nil)
        }
        
        let left = UIAlertAction(title: "Go left", style: .default, handler: leftHandler)
        let right = UIAlertAction(title: "Go right", style: .default, handler: rightHandler)
        let giveup = UIAlertAction(title: "Give up", style: .destructive, handler: giveupHandler)
        
        controller.addAction(left)
        controller.addAction(right)
        controller.addAction(giveup)
        
        present(controller, animated: false, completion: nil)
    }
    
    func getRandomNumber(range: Int) -> Int {
        return Int(arc4random_uniform(UInt32(range)))+1
    }
    
    
}
