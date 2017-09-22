//
//  Constant.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.opendota.com/api/heroes"
let IMAGE_URL = "http://cdn.dota2.com/apps/dota2/images/heroes/"
let NPC = "npc_dota_hero_"
let IMAGE_VERTICAL = "_vert.jpg"
let IMAGE_HORIZONTAL = "_lg.png"

typealias DownloadComplete = ([Hero]) -> ()
