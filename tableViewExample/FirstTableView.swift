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
        // Done Below!
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitTableViewCell", for: indexPath) as! FruitTableViewCell
        // You are going to need to do something a little different for dequing your reusable cell here!
        // https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table
        // after you create your cell, set the title and image properties!
        // let fruit = fruits[indexPath.row]
        // Delete the properties you set on the old cell!
        // cell.textLabel?.text = "\(fruit.name)"
        // cell.textLabel?.textColor = .black
        // cell.contentView.backgroundColor = fruit.color

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailViewController.detailText = "\(fruits[indexPath.row].texture.rawValue)"
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // Set the height of your cell to be 45!  Lookup tableView delegate methods to figure out how to do this!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

// Make a tableView with a list of Fruit
// Use a struct to model out your fruit object
// Do something fun on the detail screen

struct Fruit {
    let name: String
    let color: UIColor
    let texture: Texture  // Maybe try making texture an enum and use the rawValue as a string!
    let Img: UIImage?
    
    // Yay computed property!! :)
}

enum Texture: String {
    case pointy = "Ouch!"
    case smooth = "So smooth!"
    case rough = "It's bumpy!"
}

let apple = Fruit(name: "apple", color: .red, texture: .smooth, Img: #imageLiteral(resourceName: "apple.png"))
let pear = Fruit(name: "pear", color: .green, texture: .smooth, Img: #imageLiteral(resourceName: "pear"))
let pineapple = Fruit(name: "pineapple", color: .yellow, texture: .pointy, Img: #imageLiteral(resourceName: "pineapple"))
let durian = Fruit(name: "durian", color: .green, texture: .pointy, Img: #imageLiteral(resourceName: "durian"))
let orange = Fruit(name: "orange", color: .orange, texture: .rough, Img: #imageLiteral(resourceName: "orange"))
let strawberry = Fruit(name: "strawberry", color: .red, texture: .rough, Img: #imageLiteral(resourceName: "strawberry"))
let banana = Fruit(name: "banana", color: .yellow, texture: .smooth, Img: #imageLiteral(resourceName: "banana"))
let melon = Fruit(name: "melon", color: .green, texture: .rough, Img: #imageLiteral(resourceName: "melon"))
let kiwano = Fruit(name: "kiwano", color: .yellow, texture: .pointy, Img: #imageLiteral(resourceName: "kiwano"))
let cherry = Fruit(name: "cherry", color: .red, texture: .smooth, Img: #imageLiteral(resourceName: "cherry"))


var fruits = [apple, pear, strawberry, pineapple, durian, orange, banana, melon, kiwano, cherry]
// Add enough fruit to get some scrolling action! :) 
