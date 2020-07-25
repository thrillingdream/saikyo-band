//
//  tweetService.swift
//  saikyo-band
//
//  Created by I.Noro on 2020/07/24.
//  Copyright © 2020 I.Noro. All rights reserved.
//

import Foundation
import Cocoa


class TweetService{
    
    class func start(text: String){
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let encodedText = encodedText,
            let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
            
            if NSWorkspace.shared.open(url) {
                print("最強のバンド")
            }
        }
    }
}
