//
//  Team.swift
//  FightClub
//
//  Created by Angel S. Moreno on 1/15/15.
//  Copyright (c) 2015 Angel S. Moreno. All rights reserved.
//

import UIKit

class Team: NSObject {

    let name: String
    let size: Int
    let type: String
    let valid_types = ["Hero", "Villian"]
    var members: [Player] = []
    
    init(team_name: String, num_players: Int, are_heroes: Bool){
//        super.init()
        self.name = team_name
        self.size = num_players
        //        if are_heroes {
        //            self.type = self.valid_types.first!
        //            self.members = createHeroes()
        //        } else {
        //            self.type = self.valid_types.last!
        //            self.members = createVillians()
        //        }
        if are_heroes {
            self.type = "Hero"
        } else {
            self.type = "Villian"
        }
        self.members = createPlayer(self.type)
        
        
    }
    
    func createHeroes() -> [Player]{
        return createPlayer("Hero")
    }
    
    func createVillians() -> [Player]{
        return createPlayer("Villian")
    }
    
    func createPlayer(type: String) -> [Player]{
        var lineup: [Player] = []
        var used_names: [String] = []
        var player: Player
        for index in 1...self.size{
            player = uniquePlayer(type, used_names: used_names)
            used_names.append(player.name)
            lineup.append(player)
        }
        return lineup
    }
    
    func uniquePlayer(type: String, used_names: [String]) -> Player {
        var player: Player
        if type == "Hero" {
            player = GoodPlayer()
        } else {
            player = BadPlayer()
        }
        if contains(used_names, player.name) {
            player = uniquePlayer(type, used_names: used_names)
        }
        return player
    }
    
    func showLineUp(){
        for member in self.members {
            var output = member.name
            output += " ["
            output += "Strength:\(member.str), "
            output += "Defense:\(member.def), "
            output += "Health:\(member.health)"
            output += "]"
            println(output)
        }
    }
    
}
class TeamMatch{
    
}
