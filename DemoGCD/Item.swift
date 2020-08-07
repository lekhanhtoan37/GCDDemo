//
//  Item.swift
//  DemoGCD
//
//  Created by Le Toan on 8/7/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import Foundation

class Item: Codable {
    let url: String
    let id: String
}

extension Item: Equatable, Comparable {
    static func < (lhs: Item, rhs: Item) -> Bool {
        if lhs.id < rhs.id {return true}
        return false
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        if lhs.id == rhs.id { return true }
        return false
    }
    static func > (lhs: Item, rhs: Item) -> Bool {
        if lhs.id > rhs.id {return true}
        return false
    }
}

