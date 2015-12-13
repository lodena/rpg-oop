//
//  Enemy.swift
//  rpg-oop
//
//  Created by Jesus Lopez de Nava on 10/30/15.
//  Copyright © 2015 LodenaApps. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        get {
            return ["Rusty Dagger", "Cracked Buckler"]
        }
    }
    
    var type: String {
        get {
            return "Grunt"
        }
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}
