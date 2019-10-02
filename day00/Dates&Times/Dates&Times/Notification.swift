//
//  Notification.swift
//  Dates&Times
//
//  Created by jeffrey chiang on 10/1/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

struct Notification {
    
    var id: Int
    var title: String
    var dateTime: DateComponents
    
    init(id: Int, title: String, dateTime: DateComponents) {
        self.id = id
        self.title = title
        self.dateTime = dateTime
    }
}
