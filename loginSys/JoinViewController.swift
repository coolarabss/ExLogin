//
//  JoinViewController.swift
//  loginSys
//
//  Created by EuiSuk_Lee on 2017. 6. 26..
//  Copyright © 2017년 EuiSuk_Lee. All rights reserved.
//

import UIKit
import CoreData

class JoinViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBAction func addUser(_ sender: UIButton) {
        if id.text! == ""||pw.text! == ""||name.text! == ""||age.text! == ""{
            displayErrorMessage(title: "is empty field", message: "please fill all field")
            
        }
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        
        user.setValue(id.text!, forKey: "id")
        user.setValue(pw.text!, forKey: "password")
        user.setValue(name.text!, forKey: "name")
        user.setValue(age.text!, forKey: "age")
        
        do{
            try context.save()
            print("new id save")
            performSegue(withIdentifier: "goToStart", sender: nil)
            
        } catch {
            print("an error has occured")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
