//
//  myPageViewController.swift
//  loginSys
//
//  Created by EuiSuk_Lee on 2017. 6. 26..
//  Copyright © 2017년 EuiSuk_Lee. All rights reserved.
//

import UIKit
import CoreData

class myPageViewController: UIViewController {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
    
    var user : NSManagedObject! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        id.text = user!.value(forKey: "id") as? String
        name.text = user!.value(forKey: "name") as? String
        age.text = user!.value(forKey: "age") as? String

        // Do any additional setup after loading the view.
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
