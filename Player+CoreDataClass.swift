//
//  Player+CoreDataClass.swift
//  bowtie2
//
//  Created by Jake Runzer on 2020-11-15.
//
//

import Foundation
import CoreData

@objc(Player)
public class Player: NSManagedObject {
    static func createPlayer(context: NSManagedObjectContext, name: String, colour: String) -> Player {
        let newPlayer = Player(context: context)
        newPlayer.name = name
        newPlayer.colour = colour
        newPlayer.created = Date()
        
        return newPlayer
    }
    
    public var scoresArray: [PlayerScore] {
        let set = scores as? Set<PlayerScore> ?? []
        return set.sorted {
            $0.currentScore > $1.currentScore
        }
    }
    
    var wrappedName: String {
        return name ?? "Unamed"
    }
    
    var wrappedColor: String {
        return colour ?? "000000"
    }
    
    var wrappedCreated: Date {
        created ?? Date()
    }
}
