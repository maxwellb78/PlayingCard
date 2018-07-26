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
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func nextCard(){
        if playingCardView.isFaceUp {
            if let card = deck.draw() {
                playingCardView.rank = card.rank.order
                playingCardView.suit = card.suit.rawValue
            }
        }
    }
    
}

