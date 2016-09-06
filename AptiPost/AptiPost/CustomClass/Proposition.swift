//
//  Proposition.swift
//  AptiPost
//
//  Created by Antoine roy on 30/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Proposition: NSObject {
   
    var liste: [String]!
    var isImage: Bool!
    
    init (liste: [String], isImage: Bool = false) {
        self.liste = liste
        self.isImage = isImage
    }
    
}
