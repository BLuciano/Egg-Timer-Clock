//
//  ViewController.swift
//  Menu Bard
//
//  Created by Luciano Bruzzoni on 5/3/18.
//  Copyright © 2018 Luciano Bruzzoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var count = 210
    
    @IBOutlet weak var timeDisplay: UILabel!
    
    @IBAction func timeStop(_ sender: Any) {
        if timer.isValid{
            timer.invalidate()
        }
    }
    
    @IBAction func timePlay(_ sender: Any) {
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func minusTen(_ sender: Any) {
        count -= 10
        if count <= 0{
            count = 0
            timeDisplay.text = "End of Time!"
            timer.invalidate()
        } else {
            timeDisplay.text = String(count)
        }
    }
    
    @IBAction func plusTen(_ sender: Any) {
        count += 10
        timeDisplay.text = String(count)
    }
    
    @IBAction func resetTime(_ sender: Any) {
        count = 210
        timeDisplay.text = String(count)
    }
    
    @objc func processTimer(){
        count -= 1
        if count <= 0{
            count = 0
            timer.invalidate()
            timeDisplay.text = "End of Time!"
        } else {
            timeDisplay.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

