//
//  HeroCell.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit
import Kingfisher

class HeroCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    func configureCell(hero: Hero){
        nameLbl.text = hero.name
        
        var url = hero.nickName.replacingOccurrences(of: NPC, with: "")
        url.append(IMAGE_HORIZONTAL)
        let imageUrl = URL(string: IMAGE_URL + url)
        thumbImg.kf.setImage(with: imageUrl)
    }
}
