//
//  WishModel.swift
//  Wishlist
//
//  Created by Vlad on 1/12/24.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
