//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Patrick Schneider on 22/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }
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
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditingItem: item)
        }
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.itemDetailViewController(self, didFinishAddingItem: item)
    }

    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
}
