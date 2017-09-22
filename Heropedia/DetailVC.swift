//
//  DetailVC.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var hero: Hero!
    
    @IBOutlet weak var rolesLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        self.navigationItem.title = hero.name
        
        var url = hero.nickName.replacingOccurrences(of: NPC, with: "")
        url.append(IMAGE_VERTICAL)
        let imageUrl = URL(string: IMAGE_URL + url)
        thumbImg.kf.setImage(with: imageUrl)
        
        attributeLbl.text = getAttributeName(hero.attribute)
        attackLbl.text = hero.attackType
        rolesLbl.text = hero.roles
    }
    
    private func getAttributeName(_ attr: String) -> String {
        let attrName: String
        switch attr {
        case "agi":
            attrName = "Agility"
        case "int":
            attrName = "Intelligence"
        default:
            attrName = "Strength"
        }
        
        return attrName
    }
}
