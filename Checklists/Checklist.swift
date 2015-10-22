//
//  Checklist.swift
//  Checklists
//
//  Created by Patrick Schneider on 22/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""

    init(name: String) {
        self.name = name
        super.init()
    }
}
