//
//  Character.swift
//  rpg-oop
//
//  Created by Jesus Lopez de Nava on 10/30/15.
//  Copyright © 2015 LodenaApps. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
        
        set {
            _attackPwr = newValue
        }
    }

    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp > 0 {
                return true
            } else {
                return false
            }
        }
    }
    
    init(startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
    
}