//
//  getMusicInfo.swift
//  saikyo-band
//
//  Created by I.Noro on 2020/07/24.
//  Copyright © 2020 I.Noro. All rights reserved.
//

import Foundation
import Cocoa

class MusicInfo {
    
    class func getMusicInfoName()-> (String){
        let appleScript = "tell application \"Music\"\n"
            + "set trackName to name of current track\n"
            + "return trackName\n"
            + "end tell"

            var error: NSDictionary?
            let scriptObject = NSAppleScript(source: appleScript)
            if let output: NSAppleEventDescriptor = scriptObject?.executeAndReturnError(&error){
                return (output.stringValue ?? "まだないお")
            }
                
            return("[存在しないトラックを追い求めて行け]")

        }

    class func getMusicInfoArtist()-> (String){
        let appleScript = "tell application \"Music\"\n"
            + "set trackArtist to artist of current track\n"
            + "return trackArtist\n"
            + "end tell"

        var error: NSDictionary?
        let scriptObject = NSAppleScript(source: appleScript)
        if let output: NSAppleEventDescriptor = scriptObject?.executeAndReturnError(&error){                return (output.stringValue ?? "まだないお")
            
        }
        return("[存在しないアーティストを追い求めて行け]")

    }
        
    class func getMusicInfoUrl()-> (String){
        
        let artist = getMusicInfoArtist()
        let name = getMusicInfoName()
        let searchWord = artist + " " + name
        let urlString:String = "http://itunes.apple.com/search?term=\(searchWord)&country=JP&lang=ja_jp&media=music&entity=song&limit=30"
        let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodeUrlString)!
        
        var trackUrl = ""

        let task = URLSession.shared.dataTask(with: url) {(data:Data?, response:URLResponse?, error:Error?) in

            if let error = error {
                trackUrl = "client error: \(error.localizedDescription)"
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                trackUrl = "no data or no response"
                return
            }

            if response.statusCode == 200 {
                let items = try! JSONSerialization.jsonObject(with: data) as! Dictionary<String, Any>
                let result = items["results"] as! NSArray
                print(result.value(forKey: "trackViewUrl"))
                let trackUrlNSArray = result.value(forKey: "trackViewUrl")as! NSArray
                let trackUrlArray = trackUrlNSArray as NSArray as? [String] ?? [""]
                
                print(result.dictionaryWithValues(forKeys: ["trackViewUrl"]))
                trackUrl = trackUrlArray.first ?? ""
            } else {
                trackUrl = "server error: \(response.statusCode)"
            }

        }
        task.resume()
        
        sleep(1)

        return(trackUrl)
    }

}
