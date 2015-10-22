//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Patrick Schneider on 21/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false

    func toggleChecked() {
        checked = !checked
    }
}