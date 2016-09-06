//
//  globalObj.swift
//  AptiPost
//
//  Created by Antoine roy on 28/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class globalObj: NSObject {
   
    var posQuestion = 0
    var storyboard: UIStoryboard!
    let tab: [Question] = [
        Question(file: ["comprehension_oral-01.jpg"]),
        Question(file: ["comprehension_oral-02.jpg"]),
        Question(file: ["comprehension_oral-03.jpg"]),
        Question(file: ["comprehension_oral-04.jpg"]),
        Question(file: ["comprehension_oral-05.jpg"]),
        Question(file: ["comprehension_oral-06.jpg"]),
        Question(file: ["comprehension_oral-07.jpg"]),
        Question(file: ["comprehension_oral-08.jpg"]),
        Question(file: ["comprehension_oral-09.jpg"]),
        Question(file: ["comprehension_oral-10.jpg"]),
        Question(file: ["comprehension_oral-11.jpg"]),
        Question(file: ["comprehension_oral-12.jpg"]),
        Question(file: ["comprehension_oral-13.jpg"]),
        Question(file: ["comprehension_oral-14.jpg"]),
        Question(file: ["comprehension_oral-15.jpg"])
    ]
    
    let Entrainement: [Question] = [
        Question(file: ["entrainement1.png"], TQ: Question.TypeQuestion.QCU, MQ: Question.ModeQuestion.ChooseElemColor, nbPropo: 2,
            tabPropoRect: ObjQCUElemColor().tabRect, goodResponse: [1], textError: "Attention, sélectionnez le rectangle jaune.", textGood: "Exact ! Vous pouvez passez à la suite."),
        Question(file: ["entrainement2.png"], TQ: Question.TypeQuestion.QCU, MQ: Question.ModeQuestion.PropoHorizontalHexa, nbPropo: 6, tabPropo: ["1", "2", "3", "4", "5", "6"], goodResponse: [2], textError: "Attention, sélectionnez la bonne réponse (3).", textGood: "Exact ! Vous pouvez passez à la suite."),
        Question(file: ["entrainement3.png"], TQ: Question.TypeQuestion.QCU, MQ: Question.ModeQuestion.PropoHorizontalHexa, nbPropo: 2, tabPropo: ["Vrai", "Faux"], goodResponse: [0], textError: "Attention, sélectionnez la bonne réponse (Vrai).", textGood: "Exact ! Vous pouvez passez à la suite."),
        /*Question(file: ["entrainement4.png"], TQ: Question.TypeQuestion.Saisie, MQ: Question.ModeQuestion.SaisieCentre, nbPropo: 0, tabPropo: [], goodResponse: ["Orange"], textError: "Attention, sélectionnez le champs de texte puis saisissez le mot orange.", textGood: "Exact ! Vous pouvez passez à la suite.")*/
    ]
    
    /*let tab: [Question] = [
        Question(file: "entrainement01-1.jpg"),
        Question(file: "entrainement01-2.jpg"),
        Question(file: "entrainement01-3.jpg"),
        Question(file: "entrainement01-4.jpg"),
        Question(file: "entrainement01-5.jpg"),
        Question(file: "entrainement01-6.jpg"),
        Question(file: "entrainement01-7.jpg"),
        Question(file: "entrainement01-8.jpg")
    ]*/
    
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    var evaluation: Bool! = false
    var posEval: Int = 0
    var posEntrainement: Int = 0
    
}
