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
    var user : NSManagedObject! = nil
    
    @IBAction func login(_ sender: UIButton) {
        if (id.text == "" || password.text == "") {
            displayErrorMessage(title: "로그인 실패", message: "아이디와 비밀번호를 입력해주세요")
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        var users : [NSManagedObject] = []
        
        request.predicate = NSPredicate(format: "id == %@", self.id.text!)
        
        do{
           try users = context.fetch(request)
            print(users)
        }catch {
            print("faied load data")
        }
        
        if (users.count == 0) {
            displayErrorMessage(title: "로그인 할 수 없음", message: "존재하지 않는 아이디입니다")
            return
        }
        
        let Corepassword = users[0].value(forKey: "password")
            as! String
        if (Corepassword == password.text) {
            print ("success login ")
            user = users[0]
            performSegue(withIdentifier: "goToLogin" , sender: nil)
        } else {
            displayErrorMessage(title: "로그인 할 수 없음", message: "비밀번호가 일치하지 않습니다")
            return
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender : Any?){
        if segue.identifier == "goToLogin" {
            let MyPageViewController = segue.destination as! myPageViewController
            MyPageViewController.user = user
        }
        
    
    }


}

