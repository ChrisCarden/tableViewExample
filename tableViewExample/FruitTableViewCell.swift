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
    @IBOutlet private var fruitImageView: UIImageView!
    @IBOutlet private var fruitTitleLabel: UILabel!
    
    // Why are these var and not let, and why does it make sense that they are NOT private?
    var fruitTitle: String?
    var fruitImage: UIImage?
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // call configureView here!
        configureView()
    }
    
    // Why might we want to make this private?
    private func configureView() {
        // Set fruitTitle and image in here
        self.fruitImage = apple.Img
        self.fruitTitle = "apple"
        // Set the cell's accessoryType to "disclosureIndicator"
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fruitImageView?.image = nil
        fruitTitleLabel?.text = nil
        // clear out your title and image properties!
    }
}

