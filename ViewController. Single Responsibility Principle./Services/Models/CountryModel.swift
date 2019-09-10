//
//  CountryModel.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 13.06.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}
