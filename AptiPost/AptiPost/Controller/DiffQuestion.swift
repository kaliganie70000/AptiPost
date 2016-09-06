//
//  DiffQuestion.swift
//  AptiPost
//
//  Created by Antoine roy on 28/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class DiffQuestion: UIViewController {

    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //println(global.tab[global.posQuestion].file)
        img.image = UIImage(named: global.tab[global.posQuestion].file[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func launchNextQuestion(sender: AnyObject) {
        global.posQuestion += 1
        if global.posQuestion > 16 {
            return
        }
        let vc: DiffQuestion = (self.storyboard?.instantiateViewControllerWithIdentifier("idQuestion") as? DiffQuestion)!
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
