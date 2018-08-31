//
//  ItemCellTableViewCell.swift
//  GroceryList
//
//  Created by Jordan on 8/31/18.
//  Copyright © 2018 Jordan Jones. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    
    func setItem(item: GroceryItem) {
        itemLabel.text = item.name
        qtyLabel.text = String(item.quantiy)
    }

}
