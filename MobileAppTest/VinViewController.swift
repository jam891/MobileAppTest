//
//  VinViewController.swift
//  MobileApp
//
//  Created by Vitaliy Delidov on 7/10/15.
//  Copyright (c) 2015 Vitaliy Delidov. All rights reserved.
//

import UIKit

protocol VinViewControllerDelegate {
    func loadPreviousPage()
    func loadNextPage()
}

class VinViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var enterVinCarManuallyTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []

    var delegate: VinViewControllerDelegate?
    
    var index = 0
    
    // MARK: - Actions
    
    @IBAction func didTapNextButton(sender: UIButton) {
        
    }
    
    @IBAction func didTapBackButton(sender: UIButton) {
        delegate?.loadPreviousPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageImages = [
            UIImage(named:"1")!,
            UIImage(named:"2")!
        ]
        
        let pageCount = pageImages.count
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(
            pagesScrollViewSize.width * CGFloat(pageImages.count),
            pagesScrollViewSize.height)
        
        loadVisiblePages()
    }
    
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
    
       
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = UIViewContentMode.ScaleToFill
            newPageView.frame = frame
            scrollView.addSubview(newPageView)

            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
        
    }
    
    func loadVisiblePages() {
        
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage + 1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        loadVisiblePages()
    }

}

    
   