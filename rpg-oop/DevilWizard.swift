//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Jesus Lopez de Nava on 10/30/15.
//  Copyright © 2015 LodenaApps. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Blue Kimara"
    }
}