//
//  SearchHistoryViewModel.swift
//  Search3D
//
//  Created by Gaurav Saraf on 7/26/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import Foundation

class SearchHistoryViewModel: SearchHistoryViewModelProtocol {
    
    var history: [Printer]? {
        didSet {
            self.historyDidChange?(self)
        }
    }
    
    var historyDidChange: ((SearchHistoryViewModelProtocol) -> ())?
    
    required init() {
        
    }
    
    func loadHistory() {
        history = [Printer]()
    }
}
