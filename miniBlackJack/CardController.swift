//
//  CardController.swift
//  miniBlackJack
//
//  Created by Austin Hesterly on 9/10/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation

class CardController {
    
    private static let baseURLString = "http://deckofcardsapi.com/api/deck/new/draw/?count="
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void ) {
        let completeURLString = self.baseURLString + "\(numberOfCards)"
        NetworkController.dataAtURL(completeURLString) { (data) in
            guard let data = data else { completion(cards: []); return }
            guard let json = NetworkController.jsonFromData(data) else { completion(cards: []); return }
            guard let arrayOfCards = json["cards"] as? [[String : AnyObject]] else { completion( cards: []); return }
            
            var arrayOfCardObjects = [Card]()
            for cardDict in arrayOfCards {
                if let card = Card(dictionary: cardDict) {
                    arrayOfCardObjects.append(card)
                }
            }
            
            completion(cards: arrayOfCardObjects)
            
        }
    }
}