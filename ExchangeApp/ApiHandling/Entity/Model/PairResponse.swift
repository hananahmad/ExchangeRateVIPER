//
//  PairResponse.swift
//  ExchangeApp
//
//  Created by Hanan Ahmed on 1/26/23.
//

import Foundation

struct PairResponse: Decodable {
    var result: String?
    var documentation: String?
    var terms_of_use: String?
    var time_last_update_unix: Int?
    var time_last_update_utc: String?
    var time_next_update_unix: Int?
    var time_next_update_utc: String?
    var base_code: String?
    var target_code: String?
    var conversion_rate: Double?
    var conversion_result: Double?

    init() {
        
    }
}
