//
//  FirstTableView.swift
//  tableViewExample
//
//  Created by Joanna Lingenfelter on 9/8/21.
//

import UIKit

class FirstTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FruitTableViewCell.self, forCellReuseIdentifier: FruitTableViewCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // It is going to crash when you try to build right now!  take a guess as to why and try to fix it!
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        // You are going to need to do something a little different for dequing your reusable cell here!
        // https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table
        // after you create your cell, set the title and image properties!
        let fruit = fruits[indexPath.row]
        cell.textLabel?.text = "\(fruit.name)"
        cell.textLabel?.textColor = .black        
        cell.contentView.backgroundColor = fruit.color

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailViewController.detailText = "\(fruits[indexPath.row].pointyOrSmooth())"
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // Set the height of your cell to be 45!  Lookup tableView delegate methods to figure out how to do this!
}

// Make a tableView with a list of Fruit
// Use a struct to model out your fruit object
// Do something fun on the detail screen

struct Fruit {
    let name: String
    let color: UIColor
    let texture: String  // Maybe try making texture an enum and use the rawValue as a string!
    
    // Yay computed property!! :)
    func pointyOrSmooth() -> String {
        var message = "*** Shouldn't appear"
        if self.texture == "pointy" {
            message = "Ouch!"
        } else if self.texture == "smooth" {
            message = "So smooth!"
        }
        return message
    }
}

let apple = Fruit(name: "apple", color: .red, texture: "smooth")
let pear = Fruit(name: "pear", color: .green, texture: "smooth")
let pineapple = Fruit(name: "pineapple", color: .yellow, texture: "pointy")
var fruits = [apple, pear, pineapple]
// Add enough fruit to get some scrolling action! :) 
