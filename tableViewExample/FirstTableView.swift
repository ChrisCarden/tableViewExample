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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
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
}

// Make a tableView with a list of Fruit
// Use a struct to model out your fruit object
// Do something fun on the detail screen

struct Fruit {
    let name: String
    let color: UIColor
    let texture: String
    
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
