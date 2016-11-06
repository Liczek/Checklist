//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Paweł Liczmański on 05.11.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = true
        
        
            delegate?.addItemViewController(self, didFinishAdding: item)
        
//        print("Contents of the text field: \(textField.text!)")        
//        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
    
  
}
