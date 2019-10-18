//
//  Page.swift
//  Wikipedia
//
//  Created by jeffrey chiang on 10/18/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

struct WikiQuery: Decodable{
    
    var query: QueryStruct?
    var batchcomplete: String?

    }

    struct QueryStruct: Decodable {

    var normalized: [NormalizedStruct]?
    var pages: [String: PageStruct]?

    }

    struct NormalizedStruct: Decodable{

    var from: String?
    var to: String?
    }

    struct PageStruct: Decodable{

    var pageid: Int?
    var ns: Int?
    var title: String?
    var extract: String?
}
