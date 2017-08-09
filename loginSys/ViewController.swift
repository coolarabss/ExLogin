//
//  ViewController.swift
//  loginSys
//
//  Created by EuiSuk_Lee on 2017. 6. 26..
//  Copyright © 2017년 EuiSuk_Lee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        if (id.text == nil || password.text == nil) {
            displayErrorMessage(title: "failed login", message: "is empty login or password")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "id")
        var user_Id : [NSManagedObject] = []
        
        request.predicate = NSPredicate(format: "id == %@", self.id.text!)
        
        do{
           try user_Id = context.fetch(request)
            print(user_Id)
        }catch {
            print("faied load data")
        }
        
        

        
        
        
        
        performSegue(withIdentifier: "goToLogin" , sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func displayErrorMessage(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "confirm", style: .default){
            (action: UIAlertAction) -> Void in
        }
        
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

