//
//  Player.swift
//  rpg-oop
//
//  Created by Jesus Lopez de Nava on 10/30/15.
//  Copyright © 2015 LodenaApps. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name: String = "Player1"
    private var _inventory = [String]()
    
    
    var name: String {
        get {
            return _name
        }
    }

    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        self._name = name
    }
    
}
