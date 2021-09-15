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
    }
    
    // Why might we want to make this private?
    private func configureView() {
        // Set fruitTitle and image in here
        // Set the cell's accessoryType to "disclosureIndicator"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // clear out your title and image properties!
    }
}

