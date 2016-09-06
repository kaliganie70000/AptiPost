//
//  QCUPropoHorizontalHexa.swift
//  AptiPost
//
//  Created by Antoine roy on 03/08/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class QCUPropoHorizontalHexa: UIViewController {

    var question: Question!
    var tabBtn: [UIButton] = []
    var imgQuestion: UIImageView = UIImageView(frame: CGRectMake(0, 0, global.width, global.height))
    var good: Bool = false
    
    @IBOutlet var labelResultat: UILabel!
    @IBOutlet var labelAptitude: UILabel!
    @IBOutlet var labelBannTop: UILabel!
    @IBOutlet var btnLeaveEntrainement: UIButton!
    @IBOutlet var btnSuite: UIButton!
    
    let imgBtn: UIImageView = UIImageView(image: UIImage(named: "btnHexa.png"))
    let imgBtnChecked: UIImageView = UIImageView(image: UIImage(named: "btnHexaChecked.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondQuestions.png")!)
        imgQuestion.image = UIImage(named: question.file[0])
        
        let middle = question.nbPropo / 2
        
        for i in 0 ..< question.nbPropo {
            var btn: UIButton!
            
            let j: CGFloat = CGFloat(middle) - CGFloat(i)
            let w: CGFloat = imgBtn.frame.width / 2
            let wBounds: CGFloat = global.width / 2
            var interval : CGFloat = CGFloat(20)
            var x: CGFloat!
            if question.nbPropo > 6 {
                interval = 8
            }
            if question.nbPropo % 2 == 0 {
                if i < middle {
                    x = wBounds + (interval / 2) - ((j * w) + (j * interval))
                } else {
                    x = wBounds - (interval / 2) + (((j * -1) * w) + ((j - 1) * -1) * interval)
                }
            } else {
                if i < middle {
                    x = wBounds - (w / 2) - ((j * w) + (j * interval))
                } else if i == middle {
                    x = wBounds - (w / 2)
                } else {
                    x = wBounds + (w / 2) + (((j * -1) * w) + (j * -1) * interval) - w
                }
            }
            btn = UIButton(frame: CGRectMake(x, 600, w, imgBtn.frame.height / 2))
            btn.setTitle(question.tabPropo[i], forState: .Normal)
            btn.setBackgroundImage(imgBtn.image, forState: .Normal)
            btn.setBackgroundImage(imgBtnChecked.image, forState: .Highlighted)
            tabBtn.append(btn)
            btn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
            btn.tag = i
            btn.addTarget(self, action: #selector(QCUPropoHorizontalHexa.selectProposition(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            //btn.hidden = true
            self.view.addSubview(btn)
        }
        
        self.view.addSubview(imgQuestion)
        
        labelResultat.hidden = true
        btnSuite.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func selectProposition(sender: UIButton!) {
        print("coucou")
        if sender.tag == question.tabResponses[0] {
            print("bonne reponse")
            btnSuite.hidden = false
            labelResultat.hidden = false
            let attrStr = NSAttributedString(string: question.textGood, attributes: [NSForegroundColorAttributeName: UIColor(red: 40.0/255.0, green: 151.0/255.0, blue: 40.0/255.0, alpha: 1)])
            labelResultat.attributedText = attrStr
            //labelResultat.text = question.textGood
            for btn in tabBtn {
                btn.hidden = true
            }
        } else {
            labelResultat.hidden = false
            let attrStr = NSAttributedString(string: question.textError, attributes: [NSForegroundColorAttributeName: UIColor(red: 244.0/255.0, green: 0/255.0, blue: 62.0/255.0, alpha: 1)])
            labelResultat.attributedText = attrStr
            print("mauvaise reponse")
            //labelResultat.text = question.textError
        }
    }

}
