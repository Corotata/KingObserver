//
//  ViewController.swift
//  KingObserver
//
//  Created by Corotata on 01/10/2018.
//  Copyright (c) 2018 Corotata. All rights reserved.
//

import UIKit
import KingObserver

class ViewController: UIViewController, CustomDelegate {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ObserverCenter.addObserver(proto: CustomDelegate.self, observer: self)
    }
    
    @IBAction func getDataTapped(_ sender: AnyObject) {
        ObserverCenter.notifyObserver(proto: CustomDelegate.self) { (delegate) in
            delegate.hasNewData?("123")
        }
        ObserverCenter.notifyObserver(proto: CustomDelegate.self) { (delegate) in
            delegate.gotYourData("123")
        }
    }
    
    
    //MARK: DemoServiceDelegate
    func gotYourData(_ value:String) {
        topLabel.text = value
    }
    func hasNewData(_ value: String) {
        print("has new data \(value)")
    }
    
}
