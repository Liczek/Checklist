//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Paweł Liczmański on 05.11.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
  
}
