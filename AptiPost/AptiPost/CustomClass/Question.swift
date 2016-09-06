//
//  Question.swift
//  AptiPost
//
//  Created by Antoine roy on 28/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    enum TypeQuestion {
        case QCU
        case QCM
        case Saisie
        case DandD
        case Liaison
        case VraiFaux
    }
    
    enum ModeQuestion {
        case ChooseElemColor
        case PropoHorizontalHexa
        case SaisieCentre
    }
    
    var file: [String]!
    var enonce: String!
    var typeQ: TypeQuestion!
    var ModeQ: ModeQuestion!

    //texte info mauvaise/bonne reponse
    var textError: String!
    var textGood: String!
    
    var nbPropo: Int!
    var tabResponses: [Int]!

    //tableau des propositions
    var tabCGRect: [CGRect]!
    var tabPropo: [String]!
    
    init(file: [String]) {
        self.file = file
    }
    
    init(file: [String], TQ: TypeQuestion, MQ: ModeQuestion, nbPropo: Int, tabPropoRect: [CGRect], goodResponse: [Int], textError: String, textGood: String) {
        self.file = file
        self.typeQ = TQ
        self.ModeQ = MQ
        self.nbPropo = nbPropo
        self.tabCGRect = tabPropoRect
        self.tabResponses = goodResponse
        self.textError = textError
        self.textGood = textGood
    }
    
    init(file: [String], TQ: TypeQuestion, MQ: ModeQuestion, nbPropo: Int, tabPropo: [String], goodResponse: [Int], textError: String, textGood: String) {
        self.file = file
        self.typeQ = TQ
        self.ModeQ = MQ
        self.nbPropo = nbPropo
        self.tabPropo = tabPropo
        self.tabResponses = goodResponse
        self.textError = textError
        self.textGood = textGood
    }
    
}
