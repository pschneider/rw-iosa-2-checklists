//
//  ViewController.swift
//  Checklists
//
//  Created by Patrick Schneider on 20/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0text = "Walk the dog"
    var row1text = "Brush my teeth"
    var row2text = "Learn iOS Development"
    var row3text = "Soccer practice!"
    var row4text = "Eat ice cream!"

    var row0checked = false
    var row1checked = false
    var row2checked = true
    var row3checked = false
    var row4checked = true


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel

        if indexPath.row % 5 == 0 {
            label.text = row0text
        } else if indexPath.row % 5 == 1 {
            label.text = row1text
        } else if indexPath.row % 5 == 2 {
            label.text = row2text
        } else if indexPath.row % 5 == 3 {
            label.text = row3text
        } else if indexPath.row % 5 == 4 {
            label.text = row4text
        }
        configureCheckmarkForCell(cell, indexPath: indexPath)
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if indexPath.row == 0 {
                row0checked = !row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
            } else if indexPath.row == 3 {
                row3checked = !row3checked
            } else if indexPath.row == 4 {
                row4checked = !row4checked
            }
            configureCheckmarkForCell(cell, indexPath: indexPath)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func configureCheckmarkForCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0checked
        } else if indexPath.row == 1 {
            isChecked = row1checked
        } else if indexPath.row == 2 {
            isChecked = row2checked
        } else if indexPath.row == 3 {
            isChecked = row3checked
        } else if indexPath.row == 4 {
            isChecked = row4checked
        }

        cell.accessoryType = isChecked ? .Checkmark : .None
    }
}