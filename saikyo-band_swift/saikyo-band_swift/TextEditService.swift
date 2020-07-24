//
//  TextEditService.swift
//  saikyo-band_swift
//
//  Created by 野呂歩希 on 2020/07/23.
//  Copyright © 2020 I.Noro. All rights reserved.
//

import Foundation

class TextEditService: NSObject {

    static let instance = TextEditService()
    class func sharedService() -> TextEditService {
        return instance
    }

    public func printText() {
           print(name ?? "ないお")
    }
}
