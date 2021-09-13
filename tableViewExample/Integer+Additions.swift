//
//  Integer+Additions.swift
//  tableViewExample
//
//  Created by Joanna Lingenfelter on 9/8/21.
//

import Foundation

enum EvenOrOdd: String {
    case even = "Even"
    case odd = "Odd"
}

extension Int {
    var isEven: Bool {
        return evenOrOdd() == .even
    }
    
    func evenOrOdd() -> EvenOrOdd {
        return self % 2 == 0 ? .even : .odd
    }
}
