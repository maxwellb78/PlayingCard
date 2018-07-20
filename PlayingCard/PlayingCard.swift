//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Bryon Maxwell on 7/15/18.
//  Copyright © 2018 CDN  Consulting. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var description: String { return "\(rank) of \(suit)" }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        var description: String { return self.rawValue }
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
    
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "Ace"
            case .numeric(let pips) where pips == 1: return "1"
            case .numeric(let pips) where pips == 2: return "2"
            case .numeric(let pips) where pips == 3: return "3"
            case .numeric(let pips) where pips == 4: return "4"
            case .numeric(let pips) where pips == 5: return "5"
            case .numeric(let pips) where pips == 6: return "6"
            case .numeric(let pips) where pips == 7: return "7"
            case .numeric(let pips) where pips == 8: return "8"
            case .numeric(let pips) where pips == 9: return "9"
            case .numeric(let pips) where pips == 10: return "10"
            case .face(let kind) where kind == "J": return "Jack"
            case .face(let kind) where kind == "Q": return "Queen"
            case .face(let kind) where kind == "K": return "King"
            default: return ""
            }
        }
        
        //this woudl probably just be a case for each card but done this way to show different
        //ways to use a enum
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            //this is not good logic, order should be optional and return nil for default
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
    }
}
