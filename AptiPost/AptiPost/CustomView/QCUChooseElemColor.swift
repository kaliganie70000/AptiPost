//
//  QCUChooseElemColor.swift
//  AptiPost
//
//  Created by Antoine roy on 30/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class QCUChooseElemColor: UIViewController {

    var question: Question!
    
    var tabView: [UIView] = []
    var imgQuestion: UIImageView = UIImageView(frame: CGRectMake(0, 0, global.width, global.height))
    
    let pan = UIPanGestureRecognizer()
    
    @IBOutlet var labelResultat: UILabel!
    @IBOutlet var labelAptitude: UILabel!
    @IBOutlet var labelBannTop: UILabel!
    @IBOutlet var btnLeaveEntrainement: UIButton!
    @IBOutlet var btnSuite: UIButton!
    
    var good: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondQuestions.png")!)
    
        imgQuestion.image = UIImage(named: question.file[0])
        
        for i in 0 ..< question.nbPropo {
            let zone: UIView = UIView(frame: question.tabCGRect[i])
            zone.layer.borderColor = UIColor(red: 238.0/255.0, green: 162.0/255.0, blue: 24.0/255.0, alpha: 1).CGColor
            zone.layer.borderWidth = 3
            tabView.append(zone)
            zone.tag = i
            zone.hidden = true
            imgQuestion.addSubview(zone)
        }
        self.view.addSubview(imgQuestion)
        
        labelResultat.hidden = true
        btnSuite.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkAllView(point: CGPoint) {
        for v in tabView {
            if (v.frame.origin.x <= point.x) && ((v.frame.origin.x + v.frame.width) >= point.x) &&
                (v.frame.origin.y <= point.y) && ((v.frame.origin.y + v.frame.height) >= point.y) {
                    print("toto")
                    v.hidden = false
            } else {
                v.hidden = true
            }
            
        }
    }
    
    func checkResponse() -> Bool {
        var GoodResponses: [Int] = question.tabResponses
        var listResponses: [Int] = []
        
        for zone in tabView {
            if zone.hidden == false {
                listResponses.append(zone.tag)
            }
        }
        
        GoodResponses.sortInPlace()
        //sort(&GoodResponses)
        listResponses.sortInPlace()
        //sort(&listResponses)
        print(GoodResponses)
        print(listResponses)
        if GoodResponses == listResponses {
            return true
        }
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        if good == true {
            return
        }
        let touch = touches.first
        let point = touch!.locationInView(self.view)
        print("began \(point)")
        checkAllView(point)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if good == true {
            return
        }
        let touch = touches.first
        let point = touch!.locationInView(self.view)
        print("moved \(point)")
        checkAllView(point)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if good == true {
            return
        }
        let touch = touches.first
        let point = touch!.locationInView(self.view)
        print("ended \(point)")
        if checkResponse() == true {
            good = true
            labelResultat.hidden = false
            let attrStr = NSAttributedString(string: question.textGood, attributes: [NSForegroundColorAttributeName: UIColor(red: 40.0/255.0, green: 151.0/255.0, blue: 40.0/255.0, alpha: 1)])
            labelResultat.attributedText = attrStr
            btnSuite.hidden = false
//            labelResultat.text = question.textGood
            print("bonne reponse")
        } else {
            labelResultat.hidden = false
            let attrStr = NSAttributedString(string: question.textError, attributes: [NSForegroundColorAttributeName: UIColor(red: 244.0/255.0, green: 0/255.0, blue: 62.0/255.0, alpha: 1)])
            labelResultat.attributedText = attrStr
            print("mauvaise reponse")
        }
    }
    
    @IBAction func leaveEntrainement(sender: AnyObject) {
    }
    
    
    @IBAction func nextQuestion(sender: AnyObject) {
    }
    
    
    
}
