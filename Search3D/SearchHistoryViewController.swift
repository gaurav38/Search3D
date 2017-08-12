//
//  ViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 7/22/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

class SearchHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var emptyHistoryView: UIView!
    
    var viewModel: SearchHistoryViewModelProtocol? {
        didSet {
            self.viewModel?.historyDidChange = { [unowned self] viewModel in
                self.refreshView()
                self.refreshTableView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyHistoryView.isHidden = true
        
        historyTableView.dataSource = self
        viewModel = appDelegate.container.resolve(SearchHistoryViewModelProtocol.self)
        viewModel?.loadHistory()
    }
    
    func refreshView()
    {
        if viewModel?.history?.count == 0 {
            emptyHistoryView.isHidden = false
        } else {
            refreshTableView()
        }
    }

    func refreshTableView() {
        historyTableView.reloadData()
    }
    
    // Mark: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.history?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell")! as UITableViewCell
        return cell
    }
}

