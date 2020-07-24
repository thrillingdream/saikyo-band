//
//  main.swift
//  saikyo-band
//
//  Created by I.Noro on 2020/07/24.
//  Copyright © 2020 I.Noro. All rights reserved.
//

import Foundation

let artist = MusicInfo.getMusicInfoArtist()
let url = MusicInfo.getMusicInfoUrl()
let saikyo_text = EditText.editTextToSaikyo(band_name: artist, url: url)

TweetService.start(text: saikyo_text)
