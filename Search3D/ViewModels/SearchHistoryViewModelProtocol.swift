//
//  SearchHistoryViewModelProtocol.swift
//  Search3D
//
//  Created by Gaurav Saraf on 7/26/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import Foundation

protocol SearchHistoryViewModelProtocol: class {
    var history: [Printer]? { get }
    var historyDidChange: ((SearchHistoryViewModelProtocol) -> ())? { get set }
    init()
    func loadHistory()
}
