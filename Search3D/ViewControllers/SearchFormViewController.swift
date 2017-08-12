//
//  SearchFormViewController.swift
//  Search3D
//
//  Created by Gaurav Saraf on 8/1/17.
//  Copyright © 2017 Gaurav Saraf. All rights reserved.
//

import Foundation
import UIKit

class SearchFormViewController: UIPageViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private(set) var userLevelDetailsViewController: UserLevelDetailsViewController!
    private(set) var dimensionsViewController: DimensionsDetailsViewController!
    private(set) var materialsViewController: MaterialDetailsViewController!
    
    fileprivate var orderedViewControllers: [UIViewController]!
    fileprivate var viewModel: SearchViewModel! {
        didSet {
            userLevelDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserLevelDetailsViewController") as! UserLevelDetailsViewController
            userLevelDetailsViewController.viewModel = viewModel
            dimensionsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DimensionsDetailsViewController") as! DimensionsDetailsViewController
            dimensionsViewController.viewModel = viewModel
            materialsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MaterialDetailsViewController") as! MaterialDetailsViewController
            materialsViewController.viewModel = viewModel
            orderedViewControllers = [userLevelDetailsViewController, dimensionsViewController, materialsViewController]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = appDelegate.container.resolve(SearchViewModelProtocol.self) as! SearchViewModel
        configureView()
        
        if let firstViewController = orderedViewControllers?.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        dataSource = self
    }
    
    private func configureView() {
        view.backgroundColor = .white
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [SearchFormViewController.self])
        pageControl.pageIndicatorTintColor = Colors.pageTintColor
        pageControl.currentPageIndicatorTintColor = Colors.currentPageTintColor
        
        for view in self.view.subviews {
            if view is UIScrollView {
                (view as? UIScrollView)?.delaysContentTouches = false
            }
        }
    }
}

// MARK: UIPageViewControllerDataSource

extension SearchFormViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}
