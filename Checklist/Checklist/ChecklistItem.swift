//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Paweł Liczmański on 01.11.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    


func toggleChecked() {  // w odpowiednim miejscu wołam później item.toggleChecked
    checked = !checked
}
}
