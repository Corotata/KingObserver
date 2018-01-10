//
//  CustomDelegate.swift
//  KingObserver_Example
//
//  Created by Corotata on 2018/1/10.
//  Copyright © 2018年 Corotata. All rights reserved.
//

import Foundation

@objc protocol CustomDelegate {
    func gotYourData(_ value:String)
    @objc optional func hasNewData(_ value:String)
}

