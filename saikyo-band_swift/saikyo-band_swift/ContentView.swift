//
//  ContentView.swift
//  saikyo-band_swift
//
//  Created by 野呂歩希 on 2020/07/23.
//  Copyright © 2020 I.Noro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("最強のバンド")
                .frame(width: 200.0, height: 40.0)
            Button(action: botton1_action) {
                Text("tweetする")
                    .multilineTextAlignment(.center)
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

public func botton1_action(){
    print(name ?? "ないお")
    var notificationName_sender = Notification.Name("com.apple.Music.playerInfo")
    NotificationCenter.default.post(name: notificationName_sender, object: nil)
}

