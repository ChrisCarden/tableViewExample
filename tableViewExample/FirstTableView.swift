//
//  FirstTableView.swift
//  tableViewExample
//
//  Created by Joanna Lingenfelter on 9/8/21.
//

import UIKit

class FirstTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let numbers = Array(1...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let number = numbers[indexPath.row]
        cell.textLabel?.text = "\(number)"
        cell.textLabel?.textColor = .white
        
        if number.isEven {
            cell.contentView.backgroundColor = .red
        } else {
            cell.contentView.backgroundColor = .blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailViewController.detailText = "\(numbers[indexPath.row].evenOrOdd().rawValue)"
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// Make a tableView with a list of Fruit
// Use a struct to model out your fruit object
// Do something fun on the detail screen

struct Fruit {
    let name: String
    let color: UIColor
    let tastesGood: Bool
}

let apple = Fruit(name: "apple", color: .red, tastesGood: true)
let pear = Fruit(name: "pear", color: .green, tastesGood: true)
var fruits = [apple, pear]


