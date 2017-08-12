//
//  SearchResultsViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/12/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    public var viewModel: SearchViewModelProtocol!
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyView.isHidden = true
        activityIndicator.startAnimating()
    }
}
