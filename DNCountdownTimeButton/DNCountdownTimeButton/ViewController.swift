//
//  ViewController.swift
//  DNCountdownTimeButton
//
//  Created by mainone on 16/10/25.
//  Copyright © 2016年 wjn. All rights reserved.
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


    @IBAction func countdownBtnClick(_ sender: DNCountdownTimeButton) {
        sender.maxSecond = 5
        sender.countdown = true
    }
}

