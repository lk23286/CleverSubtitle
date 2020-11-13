//
//  ViewController.swift
//  CleverSubtitle
//
//  Created by Laszlo Kovacs on 2020. 11. 07..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var Answer1ButtonLabel: UIButton!
    @IBOutlet weak var Answer2ButtonLabel: UIButton!
    @IBOutlet weak var Answer3ButtonLabel: UIButton!
    @IBOutlet weak var GoodAnswerLabel: UILabel!
    @IBOutlet weak var FaceLabel: UIImageView!
    @IBOutlet weak var BadAnswerLabel: UILabel!
    let brain = Brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = brain.sentences[1].eng
        
        
    }

    @IBAction func Answer1Button(_ sender: UIButton) {
    }
    
    @IBAction func Answer2Button(_ sender: UIButton) {
    }
    
    @IBAction func Answer3Button(_ sender: UIButton) {
    }
    
}

