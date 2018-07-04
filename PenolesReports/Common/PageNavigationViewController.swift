//
//  PageNavigationViewController.swift
//  Penoles DS-2017
//
//  Created by Pablo Gomez Basanta on 5/22/18.
//  Copyright © 2018 nuevecubica. All rights reserved.
//

import UIKit

protocol Page {
  func viewController(with magazine: Magazine) -> UIViewController
}

protocol ScrollablePageViewController {
  var showsScrollIndicator: Bool { get }
}

class Section {
  var name: String
  var pages: [Page] = []
  
  init(name: String, pages: [Page]) {
    self.name = name
    self.pages = pages
  }
}

class PageNavigationViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var menuContainer: UIView!
  @IBOutlet weak var menuStackView: UIStackView!
  
  @IBOutlet weak var scrollInidcator: UIImageView!
  
  var menuConstraint: NSLayoutConstraint!
  
  var magazine: Magazine! = nil
  
  var showingMenu: Bool = false
  
  var currentIndexPath: IndexPath? {
    return collectionView.indexPathsForVisibleItems.first
  }
  
  weak var lastVisibleCell: PageCollectionViewCell?
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
    NSLayoutConstraint.activate([menuConstraint])
    setupMenuStackView()
    
    setupForIndexPath(IndexPath(item: 0, section: 0))
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupForCurrentPage()
  }
  
  func setupMenuStackView() {
    for view in menuStackView.arrangedSubviews {
      view.removeFromSuperview()
    }
    
    for (index,section) in magazine.sections.enumerated() {
      let button = UIButton(type: .custom)
      button.setTitle(section.name, for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.tag = index
      button.addTarget(self, action: #selector(sectionTapped(_:)), for: .touchUpInside)
      button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
      button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
      button.translatesAutoresizingMaskIntoConstraints = false
      menuStackView.addArrangedSubview(button)
      
      NSLayoutConstraint.activate([
        button.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
  }
  
  @IBAction func backTapped(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func sectionTapped(_ sender: UIButton) {
    let indexPath = IndexPath(item: 0, section: sender.tag)
    collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    view.layoutIfNeeded()
    setupForIndexPath(indexPath)
    toggleMenu(sender)
  }
  
  @IBAction func toggleMenu(_ sender: UIButton) {
    NSLayoutConstraint.deactivate([menuConstraint])
    
    if showingMenu {
      // Hide
      menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
    }
    else {
      // Show
      menuConstraint = NSLayoutConstraint(item: menuContainer, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
    }
    
    NSLayoutConstraint.activate([menuConstraint])
    
    UIView.animate(withDuration: 0.5) {
      self.view.layoutIfNeeded()
    }
    
    showingMenu = !showingMenu
  }
}

extension PageNavigationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return magazine.sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return magazine.sections[section].pages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as! PageCollectionViewCell
    
    cell.magazine = magazine
    cell.setupWithPage(magazine.sections[indexPath.section].pages[indexPath.item], insideViewController: self)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionView.bounds.size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension PageNavigationViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    scrollInidcator.isHidden = true
    lastVisibleCell = collectionView.visibleCells.first as? PageCollectionViewCell
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if !decelerate { setupForCurrentPage() }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    setupForCurrentPage()
  }
  
  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    setupForCurrentPage()
  }
  
  func setupForCurrentPage() {
    setupForIndexPath(currentIndexPath ?? IndexPath(item: 0, section: 0))
  }
  
  func setupForIndexPath(_ indexPath: IndexPath) {
    titleLabel.text = magazine.sections[indexPath.section].name
    
    let currentCell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell
    
    if currentCell != lastVisibleCell {
      if let pageVC = lastVisibleCell?.childViewController as? PageViewController {
        pageVC.scrollView.zoomScale = 1.0
      }
    }
    
    if let scrollableVW = currentCell?.childViewController as? ScrollablePageViewController {
      scrollInidcator.isHidden = !scrollableVW.showsScrollIndicator
    } else {
      scrollInidcator.isHidden = true
    }
    
    if let coverViewVC = currentCell?.childViewController as? CoverViewController {
      coverViewVC.animateIntro()
    }
    
    lastVisibleCell = nil
  }
}

class PageCollectionViewCell: UICollectionViewCell {
  var magazine: Magazine! = nil
  var page: Page?
  var childViewController: UIViewController?
  var childView: UIView?
  
  func setupWithPage(_ page: Page, insideViewController viewController: UIViewController) {
    self.page = page
    childViewController = page.viewController(with: magazine)
    childView = childViewController?.view
    
    guard let childViewController = childViewController, let childView = childView else { return }
    
    viewController.addChildViewController(childViewController)
    addSubview(childView)
    
    childView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      leadingAnchor.constraint(equalTo: childView.leadingAnchor),
      trailingAnchor.constraint(equalTo: childView.trailingAnchor),
      topAnchor.constraint(equalTo: childView.topAnchor),
      bottomAnchor.constraint(equalTo: childView.bottomAnchor)
      ])
    
    childViewController.didMove(toParentViewController: viewController)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    childViewController?.willMove(toParentViewController: nil)
    childView?.removeFromSuperview()
    childViewController?.removeFromParentViewController()
    
    childView = nil
    childViewController = nil
  }
}
