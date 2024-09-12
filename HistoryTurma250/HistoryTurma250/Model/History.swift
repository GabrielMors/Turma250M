//
//  History.swift
//  HistoryTurma250
//
//  Created by Gabriel Mors  on 16/06/24.
//

import Foundation

struct History: Codable {
    var totalValue: Double
    var historyAccountList: [HistoryAccountList]
}

struct HistoryAccountList: Codable {
    var name: String
    var price: Double
}
