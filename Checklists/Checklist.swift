//
//  Checklist.swift
//  Checklists
//
//  Created by Patrick Schneider on 22/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
    var name = ""
    var iconName: String
    var items = [ChecklistItem]()

    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }

    init(name: String, iconName: String) {
        self.name = name
        self.iconName = iconName
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(iconName, forKey: "IconName")
        aCoder.encodeObject(items, forKey: "Items")
    }

    func countUncheckedItems() -> Int {
//        var count = 0
//        for item in items where !item.checked { count++ }
//        return count
        return items.reduce(0) { (cnt, item) in cnt + (item.checked ? 0 : 1) }
    }
}
