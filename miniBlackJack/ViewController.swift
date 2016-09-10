//
//  ViewController.swift
//  miniBlackJack
//
//  Created by Austin Hesterly on 9/10/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    @IBAction func playButtonTapped(sender: AnyObject) {
        CardController.drawCards(2) { (cards) in
            NetworkController.imageForURL(cards[0].imageEndpoint, completion: { (image) in
                self.leftImageView.image = image
            })
            NetworkController.imageForURL(cards[1].imageEndpoint, completion: { (image) in
                self.rightImageView.image = image
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

