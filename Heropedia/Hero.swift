//
//  Hero.swift
//  Heropedia
//
//  Created by Didik Ismawanto on 9/21/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import Foundation

class Hero {
    private var _id: Int!
    private var _nickName: String!
    private var _name: String!
    private var _attribute: String!
    private var _attackType: String!
    private var _roles: String!
    
    var id: Int {
        get {
            return _id
        } set {
            _id = newValue
        }
    }
    
    var nickName: String {
        get {
            return _nickName
        } set {
            _nickName = newValue
        }
            
    }
    
    var name: String {
        get {
           return _name
        } set {
            _name = newValue
        }
    }
    
    var attribute: String {
        get {
            return _attribute
        } set {
            _attribute = newValue
        }
    }
    
    var attackType: String {
        get {
            return _attackType
        } set {
            _attackType = newValue
        }
    }
    
    var roles: String {
        get {
            return _roles
        } set {
            _roles = newValue
        }
    }
    
}
