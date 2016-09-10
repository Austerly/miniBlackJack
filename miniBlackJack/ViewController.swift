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
        NetworkController.dataAtURL("http://deckofcardsapi.com/api/deck/new/draw/?count=2") { (data) in
            print("data:", data)
            guard let data = data else {return}
            print("NetworkController JSON from Data: ", NetworkController.jsonFromData(data))
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

