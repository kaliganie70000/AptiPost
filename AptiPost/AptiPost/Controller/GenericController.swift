//
//  GenericController.swift
//  AptiPost
//
//  Created by Antoine roy on 29/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

extension UIImage {
    func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blueColor().CGColor)
        let rectangle = CGRectMake(60,170,200,80)
        CGContextAddRect(context, rectangle)
        CGContextStrokePath(context)
    }
}

class GenericController: UIViewController {

    var Evaluation: Int = 0
    var question: Question!
    let lines: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        /*if Evaluation == 0 { //Entrainement
            styleView = findTheGoodStyleView()
        }*/
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "QCUChooseElemColor", bundle: bundle)
        let view: UIView! = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        print(view)
        self.view.addSubview(view)
        //self.view.addSubview(styleView!)
        //self.view.sendSubviewToBack(styleView!)
//        self.view.addSubview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*func findTheGoodStyleView() -> UIView? {
        if question.typeQ == Question.TypeQuestion.QCU {
            println("type qcu")
            if question.ModeQ == Question.ModeQuestion.ChooseElemColor {
                return QCUChooseElemColor(frame: CGRectMake(0, 0, global.width, global.height))
            }
        }
        println("autre")
        return UIView()
    }*/
    
    func toto() {
        
    }
    
    @IBAction func leaveEntrainement(sender: AnyObject) {
        let vc: AccueilController = (self.storyboard?.instantiateInitialViewController() as? AccueilController)!
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
