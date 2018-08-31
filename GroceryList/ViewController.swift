//
//  ViewController.swift
//  GroceryList
//
//  Created by Jordan on 8/31/18.
//  Copyright © 2018 Jordan Jones. All rights reserved.
//

struct GroceryItem {
    
    var name: String
    var quantiy: Int
}

import UIKit

class ViewController: UITableViewController {
    
    var groceryList = [GroceryItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        groceryList = createGroceryArray()
        self.title = "Grocery List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func createGroceryArray() -> [GroceryItem] {
        
        var tempList = [GroceryItem]()
        
        let item1 = GroceryItem(name: "Apples", quantiy: 2)
        let item2 = GroceryItem(name: "Pasta", quantiy: 1)
        let item3 = GroceryItem(name: "Pizza rolls", quantiy: 20)
        let item4 = GroceryItem(name: "Funyuns", quantiy: 2)
        
        tempList.append(item1)
        tempList.append(item2)
        tempList.append(item3)
        tempList.append(item4)
        
        return tempList
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemCell
        
        let item = groceryList[indexPath.row]
        
        cell.setItem(item: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            groceryList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

