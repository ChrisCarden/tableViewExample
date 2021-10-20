//
//  FruitTableViewCell.swift
//  tableViewExample
//
//  Created by Joanna Lingenfelter on 9/15/21.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    static var reuseIdentifier: String { return "\(FruitTableViewCell.self)" }
    
    // set the image in here with "fruitImageView.image = UIImage(named: "whatever your image is called")"
    @IBOutlet private var fruitImageView: UIImageView?
    @IBOutlet private var fruitTitleLabel: UILabel?

    var fruit: Fruit?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    // Why might we want to make this private?
    func configureView(for fruit: Fruit) {
        fruitImageView?.image = fruit.Img
        fruitTitleLabel?.text = fruit.name
        contentView.backgroundColor = fruit.color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fruitImageView?.image = nil
        fruitTitleLabel?.text = nil
        // clear out your title and image properties!
    }
}

