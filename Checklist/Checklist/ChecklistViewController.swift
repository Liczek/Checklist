//
//  ViewController.swift
//  Checklist
//
//  Created by Paweł Liczmański on 31.10.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        print("Add Item Canceled")
        dismiss(animated: true, completion: nil)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
        
        let newRowIndex = items.count
        items.append(item)
        
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        print("Add Item Completed")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! AddItemViewController
            controller.delegate = self
        }
    }
    
    var items: [ChecklistItem]
    
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [ChecklistItem]()
        
        let row0item = ChecklistItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        let row5item = ChecklistItem()
        row5item.text = "Go to work"
        row5item.checked = true
        items.append(row5item)
        
        let row6item = ChecklistItem()
        row6item.text = "play CS with freinds"
        row6item.checked = true
        items.append(row6item)
        
        let row7item = ChecklistItem()
        row7item.text = "Sleep"
        row7item.checked = true
        items.append(row7item)
        
        let row8item = ChecklistItem()
        row8item.text = "Go to GYM"
        row8item.checked = true
        items.append(row8item)
        
        let row9item = ChecklistItem()
        row9item.text = "Cooking a diner"
        row9item.checked = false
        items.append(row9item)
        
        let row10item = ChecklistItem()
        row10item.text = "Take a shower"
        row10item.checked = true
        items.append(row10item)
        
        let row11item = ChecklistItem()
        row11item.text = "Make tea or two"
        row11item.checked = true
        items.append(row11item)
        
        let row12item = ChecklistItem()
        row12item.text = "play with cats"
        row12item.checked = true
        items.append(row12item)
        
        let row13item = ChecklistItem()
        row13item.text = "Drink smth"
        row13item.checked = true
        items.append(row13item)
        
        let row14item = ChecklistItem()
        row14item.text = "Repair dors"
        row14item.checked = true
        items.append(row14item)
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //1 remove from arrey of items
        items.remove(at: indexPath.row)
        
        //2 delete row from tableView
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // Methods
    //MARK: 1. Config Text and Checkmark
    func configureCheckmark(for cell: UITableViewCell,
                            with item: ChecklistItem) {   // to jest ten "item" który w cellForRowAt  i didSelectRowAt wyciągamy z [ChecklistItem] czyli ten let item =
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
        
    
    
    
    

}

