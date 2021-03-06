//
//  FightClubClass.swift
//  FightClub
//
//  Created by Angel S. Moreno on 1/14/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class FightClubClass: NSObject {
   
}





class Player {
    var name: String = "Unkown Player"
    var health: Int = 100
    var str: Int
    var def: Int
    var type: String?
    
    init(){
        self.str = Int(arc4random_uniform(4)+1)
        self.def = Int(arc4random_uniform(9)+1)
    }
    
    init(player_name: String){
        self.name = player_name
        //@todo how do I call init() from inside this initializer to avoid having to set the str and def here as well?
        self.str = Int(arc4random_uniform(4)+1)
        self.def = Int(arc4random_uniform(9)+1)
    }
    
    func attack() -> (atk_type: String, dmg: Int) {
        return (pickRandomFromArrayOfString(["Kick","Punch"]), self.str * Int(arc4random_uniform(9)+1))
    }
    
    func isAlive() -> Bool {
        return health > 0
    }
    
    func kick(){}
    func punch(){}
    func dodge(){}
    
}
class GoodPlayer: Player{
    override init(){
        super.init()
        self.name = NameGenerator().hero()
        self.type = "good"
    }
}
class BadPlayer: Player {
    override init(){
        super.init()
        self.name = NameGenerator().villian()
        self.type = "bad"
    }
    
}

func pickRandomFromArrayOfString(arr: [String]) -> String {
    let randomIndex = Int(arc4random_uniform(UInt32(arr.count)))
    return arr[randomIndex]
}

class NameGenerator {
    let colors = [
        "Red",
        "Blue",
        "Yellow",
        "Green",
        "Black"
    ]
    
    let animals = [
        "Monkey",
        "Snake",
        "Panda",
        "Grasshopper",
        "Tiger",
        "Lion",
        "Bear",
        "Whale",
        "Turtle",
        "Rabbit"
    ]
    
    let greeks = [
        "Zeus",
        "Hera",
        "Hermes",
        "Ares",
        "Aphrodite",
        "Apollo",
        "Artemis",
        "Athena",
        "Demeter",
        "Dionysus",
        "Hephaestus",
        "Hestia",
        "Poseidon",
    ]
    
    let adjectives = [
        "abandoned",
        "able",
        "absolute",
        "adorable",
        "adventurous",
        "academic",
        "acceptable",
        "acclaimed",
        "accomplished",
        "accurate",
        "aching",
        "acidic",
        "acrobatic",
        "active",
        "actual",
        "adept",
        "admirable",
        "admired",
        "adolescent",
        "adorable",
        "adored",
        "advanced",
        "afraid",
        "affectionate",
        "aged",
        "aggravating",
        "aggressive",
        "agile",
        "agitated",
        "agonizing",
        "agreeable",
        "ajar",
        "alarmed",
        "alarming",
        "alert",
        "alienated",
        "alive",
        "all",
        "altruistic",
        "amazing",
        "ambitious",
        "ample",
        "amused",
        "amusing",
        "anchored",
        "ancient",
        "angelic",
        "angry",
        "anguished",
        "animated",
        "annual",
        "another",
        "antique",
        "anxious",
        "any",
        "apprehensive",
        "appropriate",
        "apt",
        "arctic",
        "arid",
        "aromatic",
        "artistic",
        "ashamed",
        "assured",
        "astonishing",
        "athletic",
        "attached",
        "attentive",
        "attractive",
        "austere",
        "authentic",
        "authorized",
        "automatic",
        "avaricious",
        "average",
        "aware",
        "awesome",
        "awful",
        "awkward",
    ]
    
    let snakes = [
        "Anatolian Viper",
        "Angolan Dwarf Python",
        "Armenian Viper",
        "Aruba Island Rattlesnake",
        "Ball Python",
        "Black Milk Snake",
        "Black Rat Snake",
        "Black-headed Python",
        "Black-speckled Palm-pitviper",
        "Boelen's Python",
        "Bolkar Viper",
        "Bornean Leaf-nosed Pitviper",
        "Brazilian Rainbow Boa",
        "Burmese Python",
        "Caucasus Viper",
        "Central American Bushmaster",
        "Central Asian Cobra",
        "Corn Snake",
        "Dumeril's Boa",
        "Eastern Diamondback Rattlesnake",
        "Emerald Tree Boa",
        "Fea's Viper",
        "Grand Canyon Rattlesnake",
        "Great Basin Gopher Snake",
        "Green Anaconda",
        "Green Tree Python",
        "Jamaican Boa",
        "King Cobra",
        "Lataste's Viper",
        "Leaf-nosed Viper",
        "Madagascar Ground Boa",
        "Madagascar Tree Boa",
        "Massasauga Rattlesnake",
        "Mexican Lance-headed Rattlesnake",
        "Moorish Viper",
        "Mt. Mang Pitviper",
        "Northern Death Adder",
        "Ocellate Mountain Viper",
        "Osage Copperhead",
        "Philippine Pitviper",
        "Prairie Kingsnake",
        "Red-tailed Boa Constrictor",
        "Reticulated Python",
        "Ridgenosed Rattlesnake",
        "Rosy Boa",
        "Sawu Python",
        "Side-striped Palm-pitviper",
        "Southern Twig Snake",
        "Speckled Forest Pitviper",
        "Stuart's Milk Snake",
        "Szechwan Speckled Pitviper",
        "Timber Rattlesnake",
        "West African Gaboon Viper",
        "Western Cottonmouth",
        "Western Pygmy Rattlesnake",
        "Yangtze Mamushi",
        "Yellow-blotched Palm-pitviper",
    ]
    
    func villian() -> String{
        var name = "The "
        name += pickRandomFromArrayOfString(self.adjectives)
        name += " "
        name += pickRandomFromArrayOfString(snakes)
        return name
    }
    
    func hero() -> String{
        var name = pickRandomFromArrayOfString(colors)
        name += " "
        name += pickRandomFromArrayOfString(animals)
        name += " "
        name += pickRandomFromArrayOfString(["Son", "Daughter"])
        name += " of "
        name += pickRandomFromArrayOfString(greeks)
        return name
    }
}

class Match{
    let player1 : GoodPlayer
    let player2 : BadPlayer
    
    init(firstPlayer : GoodPlayer, secondPlayer: BadPlayer){
        player1 = firstPlayer
        player2 = secondPlayer
    }
    
    func playGame() -> Player {
        var attacker: Player
        var defender: Player
        
        while(player1.isAlive() && player2.isAlive()){
            if Int(arc4random_uniform(2)) == 0 {
                attacker = player1
                defender = player2
            } else {
                attacker = player2
                defender = player1
            }
            round(attacker, defender:defender)
        }
        println("\"\(whoWon().name)\" wins!")
        return whoWon()
    }
    
    func round(attacker: Player, defender: Player) {
        var attack = attacker.attack()
        
        print("\"\(attacker.name)\" attacks with a \(attack.atk_type) and does \(attack.dmg) dmg. ")
        defender.health -= attack.dmg
        println("\"\(defender.name)\" now has \(defender.health) life. ")
        
        
        if(defender.isAlive() == false){
            print("\"\(defender.name)\" dies. ")
        }
        
    }
    
    func whoWon() -> Player {
        if player1.isAlive() {
            return player1
        } else {
            return player2
        }
    }
    
    func resetPlayersHealth(){
        player1.health = 100
        player2.health = 100
    }
    
    func matchTitle() -> String {
        return "\(player1.name) Vs. \(player2.name)"
    }
    
}

//let team1 = Team(team_name: "Team 1", num_players: 3, are_heroes: true)
//let team2 = Team(team_name: "Team 2", num_players: 3, are_heroes: false)
////team2.showLineUp()
//let good = GoodPlayer()
//let evil = BadPlayer()
//let match1 = Match(firstPlayer: good, secondPlayer: evil)
//println(match1.matchTitle())
//for round in 1...3{
//    println("Round \(round)")
//    match1.resetPlayersHealth()
//    match1.playGame()
//}

//
//let ken = GoodPlayer(player_name:"Ken")
//let match2 = Match(firstPlayer: ken, secondPlayer: dhalsim)
//match2.playGame()
//

