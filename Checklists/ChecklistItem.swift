//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Patrick Schneider on 21/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import Foundation
import UIKit

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    var shouldRemind = false
    var dueDate = NSDate()
    var itemID: Int

    // MARK: State
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    convenience init(text: String) {
        self.init(text: text, checked: false)
    }

    convenience init(text: String, checked: Bool) {
        self.init()
        self.text = text
        self.checked = checked
    }

    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        dueDate = aDecoder.decodeObjectForKey("DueDate") as! NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID = aDecoder.decodeIntegerForKey("ItemID")
        super.init()
    }

    func toggleChecked() {
        checked = !checked
    }

    deinit {
        if let notification = notificationForThisItem() {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
    }

    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }

    // MARK: Notification
    func scheduleNotification() {
        if let notification = notificationForThisItem() {
            UIApplication.sharedApplication().cancelLocalNotification(notification)
        }
        if shouldRemind && dueDate.compare(NSDate()) != .OrderedAscending {
            let localNotification = UILocalNotification()
            localNotification.fireDate = dueDate
            localNotification.timeZone = NSTimeZone.defaultTimeZone()
            localNotification.alertBody = text
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.userInfo = ["ItemID": itemID]
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        }
    }

    func notificationForThisItem() -> UILocalNotification? {
        let allNotifications = UIApplication.sharedApplication().scheduledLocalNotifications!
        for notification in allNotifications {
            if let number = notification.userInfo?["ItemID"] as? Int where number == itemID {
                return notification
            }
        }
        return nil
    }
}