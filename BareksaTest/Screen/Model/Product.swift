//
//  Product.swift
//  BareksaTest
//
//  Created by Denny Arfansyah on 05/07/22.
//

import Foundation

struct Product: Codable {
    
    var code: Int
    var message: String
    var error: String
    var total_data: Int
    var data: [Detail]
    
}
