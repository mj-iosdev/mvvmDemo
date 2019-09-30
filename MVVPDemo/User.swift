//
//  User.swift
//  MVVPDemo
//
//  Created by Orange on 30/08/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let age: Int
    let backgroundColor: UIColor
    
    init(name: String, age: Int, backgroundColor: UIColor) {
        self.name = name
        self.age = age
        self.backgroundColor = backgroundColor
    }
}
