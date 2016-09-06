//
//  Metier.swift
//  AptiPost
//
//  Created by Antoine roy on 24/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit

class Metier: NSObject {

    var title: String = ""
    var aptitutes: [Bool] = []
    
    init(title: String, apt: [Bool]) {
        self.title = title
        self.aptitutes = apt
    }
    
}
