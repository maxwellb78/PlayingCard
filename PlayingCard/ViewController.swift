//
//  ViewController.swift
//  PlayingCard
//
//  Created by Bryon Maxwell on 7/15/18.
//  Copyright © 2018 CDN  Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...52{
            if let card = deck.draw() {
                print (card)
            }
        }
    }

}

