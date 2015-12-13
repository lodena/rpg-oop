//
//  ViewController.swift
//  rpg-oop
//
//  Created by Jesus Lopez de Nava on 10/30/15.
//  Copyright © 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBOutlet weak var attackBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Brave34", hp: 110, attackPwr: 0)
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
            enemyImg.image = UIImage(named: "enem1")
        } else {
            enemy = DevilWizard(startingHP:60, attackPwr: 15)
            enemyImg.image = UIImage(named: "enem2")
        }
        
        enemyImg.hidden = false
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "Press attack button to start!"
        attackBtn.enabled = true
    }

    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        
        let rand = Int(arc4random_uniform(20)) 
        player.attackPwr = rand + 1
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "\(player.name) attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was not effective: \(player.attackPwr)"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
            attackBtn.enabled = false
        }
    
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)!"
            enemyImg.hidden = true
        }
    
    }
    
    
}

