//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Patrick Schneider on 21/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false

    // MARK: State
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }

    func toggleChecked() {
        checked = !checked
    }

    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
}