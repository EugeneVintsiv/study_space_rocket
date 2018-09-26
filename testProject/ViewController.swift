//
//  ViewController.swift
//  testProject
//
//  Created by Eugene on 26.09.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var actionHolder: UIView!
    @IBOutlet weak var rocketImg: UIImageView!
    @IBOutlet weak var toggleLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "action-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func toggleButtonPress(_ sender: Any) {
        actionHolder.isHidden = false
        background.isHidden = true
        toggleButton.isHidden = true
        resetButton.isHidden = true

        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.changeRocketPosition(y: 120)
        }) { (finished) in
            self.toggleLabel.isHidden = false
            self.resetButton.isHidden = false
        }
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        actionHolder.isHidden = true
        background.isHidden = false
        toggleButton.isHidden = false
        resetButton.isHidden = false
        toggleLabel.isHidden = true
        changeRocketPosition(y: 400)
    }
    
    fileprivate func changeRocketPosition(y: Int) {
        self.rocketImg.frame = CGRect(x: 0, y: y, width: 375, height: 402)
    }
}

