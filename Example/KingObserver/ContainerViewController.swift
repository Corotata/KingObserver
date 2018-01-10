//
//  ContainerViewController.swift
//  KingObserver_Example
//
//  Created by Corotata on 2018/1/10.
//  Copyright © 2018年 Corotata. All rights reserved.
//

import UIKit
import KingObserver
class ContainerViewController: UIViewController,CustomDelegate {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ObserverCenter.addObserver(proto: CustomDelegate.self, observer: self)
    }
    
    
    //MARK: CustomDelegate
    func gotYourData(_ value:String) {
        label.text = value
    }
    func hasNewData(_ value: String) {
        print("ContainerViewController has new data \(value)")
    }

}
