//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Patrick Schneider on 22/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    weak var delegate: AddItemViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    // MARK: View Controller Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    // MARK: Table View

    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }

    // MARK: Text Field Delegate

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)

        doneBarButton.enabled = (newText.length > 0)

        return true
    }

    // MARK: Actions

    @IBAction func done() {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinishAddingItem: item)
    }

    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
}
