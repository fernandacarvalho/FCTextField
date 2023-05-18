//
//  BundleUtil.swift
//  FCTextField
//
//  Created by Fernanda FC. Carvalho on 18/05/23.
//

import Foundation

open class BundleUtil: NSObject {
    public static var bundle: Bundle {
        get {
            var bundle = Bundle(for: self.classForCoder())
            if let bundlePath:String = bundle.path(forResource: "FCTextField", ofType: "bundle")
            {
                bundle =  Bundle(path: bundlePath)!
            }
            return bundle
        }
    }
}
