//
//  HeroRepo.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HeroRepo{
    func getHeroes(downloadComplete: @escaping DownloadComplete) {
        Alamofire.request(BASE_URL).responseJSON { (response) in
            if let value = response.result.value {
                let json = JSON(value)
                
                var heroes = [Hero]()
                
                for item in json.array! {
                    let hero = Hero()
                    
                    if let id = item["id"].int {
                        hero.id = id
                    }
                    
                    if let nick = item["name"].string {
                        hero.nickName = nick
                    }
                    
                    if let name = item["localized_name"].string {
                        hero.name = name
                    }
                    
                    if let attribute = item["primary_attr"].string {
                        hero.attribute = attribute
                    }
                    
                    if let attack = item["attack_type"].string {
                        hero.attackType = attack
                    }
                    
                    if let roles = item["roles"].array {
                        var str = ""
                        for role in roles {
                            if str.isEmpty {
                                str.append(role.string!)
                            } else {
                                str.append(", \(role.string!)")
                            }
                        }
                        
                        hero.roles = str
                    }
                    
                    heroes.append(hero)
                }
                
                downloadComplete(heroes)
            }
        }
    }
}
