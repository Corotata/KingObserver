//
//  ObserverCenter.swift
//  ObserverCenter
//
//  Created by Corotata on 2018/1/10.
//  Copyright © 2018年 Corotata. All rights reserved.
//

import UIKit

open class ObserverCenter {
    static let defaultObserverCenter = ObserverCenter()
    
    var dictObservers: [String : Any] = [String : Any]()
    
    public class func addObserver<T: AnyObject>(proto: T.Type,observer: T){
        let mObserver = defaultObserverCenter.getObservers(proto: proto)
        mObserver.addDelegate(observer)
    }
    
    public class func removeObserver<T: AnyObject>(proto: T.Type,observer: T){
        let mObserver = defaultObserverCenter.getObservers(proto: proto)
        mObserver.removeDelegate(observer)
    }
    
    public class func notifyObserver<T: AnyObject>(proto: T.Type,_  invocation:@escaping (T) -> ()) {
        let mObserver = defaultObserverCenter.getObservers(proto: proto)
        mObserver.invokeDelegates { (delegate) in
            if Thread.current.isMainThread{
                invocation(delegate)
            }else{
                DispatchQueue.main.async(execute: {
                    invocation(delegate)
                })
            }
        }
    }
    
    
    private func getObservers<T: AnyObject>(proto: T.Type) -> MulticastDelegate<T>{
        return self.getObservers(proto: proto, key: "test")
        
    }
    
    private func getObservers<T: AnyObject>(proto: T.Type,key:String) -> MulticastDelegate<T> {
        let mKey = "[\(proto)-\(key)]"
        var observer = dictObservers[mKey]
        print(mKey)
        if observer == nil{
            observer = MulticastDelegate<T>()
            dictObservers[mKey] = observer
        }
        return observer as! MulticastDelegate<T>
    }
    
}
