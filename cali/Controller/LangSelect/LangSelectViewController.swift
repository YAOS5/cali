//
//  ViewController.swift
//  cali
//
//  Created by Peteski Shi on 4/5/19.
//  Copyright © 2019 Petech. All rights reserved.
//

import UIKit

class LangSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func ChineseSelected(_ sender: UIButton) {
        networking("chinese")
    }
    
    
    @IBAction func BanglaSelected(_ sender: UIButton) {
    }
    
    
    @IBAction func ArabicSelected(_ sender: UIButton) {
    }
    
    

}

