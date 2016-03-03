//
//  NSProcessInfoExtensions.swift
//  XcodeUITestingDemo
//
//  Created by Douglas Sjoquist on 3/3/16.
//  Copyright © 2016 Ivy Gulch LLC. All rights reserved.
//

import Foundation

extension NSProcessInfo {

    func valueForEnvironmentKey(name:String) -> String? {
        return environment[name]
    }

}