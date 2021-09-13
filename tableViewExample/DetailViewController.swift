//
//  DetailViewController.swift
//  tableViewExample
//
//  Created by Joanna Lingenfelter on 9/8/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private var detailLabel: UILabel!
    
    var detailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = detailText
    }
}
