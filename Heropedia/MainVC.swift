//
//  ViewController.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var collection: UICollectionView!
    
    private let repo = HeroRepo()
    private var heroes = [Hero]()
    private var viewUtils: ViewControllerUtils!
    private var filteredHeroes = [Hero]()
    private var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        search.delegate = self
        search.returnKeyType = UIReturnKeyType.done
        
        viewUtils = ViewControllerUtils(self.view)
        viewUtils.showActivityIndicator()
        
        repo.getHeroes { response in
            self.heroes = response
            self.collection.reloadData()
            
            self.viewUtils.hideActivityIndicator()
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
            
            let hero: Hero
            if inSearchMode {
                hero = filteredHeroes[indexPath.row]
            } else {
                hero = heroes[indexPath.row]
            }
            
            cell.configureCell(hero: hero)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredHeroes.count
        }
        return heroes.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero: Hero
        if inSearchMode {
            hero = filteredHeroes[indexPath.row]
        } else {
            hero = heroes[indexPath.row]
        }
        
        performSegue(withIdentifier: "DetailVC", sender: hero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let detailVC = segue.destination as? DetailVC {
                if let hero = sender as? Hero {
                    detailVC.hero = hero
                }
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            filteredHeroes = heroes.filter({$0.name.lowercased().range(of: lower) != nil})
            collection.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

