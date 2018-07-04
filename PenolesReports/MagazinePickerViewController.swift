//
//  MagazinePickerViewController.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 6/30/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit

class MagazinePickerViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
  var magazines: [Magazine] = [
    DSEspMagazine.shared,
    DSEngMagazine.shared,
    AIEspMagazine.shared,
    AIEngMagazine.shared
  ]
  
  var indexForIdentifier: [String: Int] = [:]
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for (index, magazine) in magazines.enumerated() {
      indexForIdentifier[magazine.identifier] = index
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    collectionView.reloadData()
    DownloadManager.shared.delegate = self
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    DownloadManager.shared.delegate = self
  }
}

extension MagazinePickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return magazines.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "magazineCell", for: indexPath) as! MagazineCell
    
    cell.configure(magazine: magazines[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let magazine = magazines[indexPath.item]
    
    if FileManager.default.fileExists(atPath: magazine.directory.path, isDirectory: nil) {
      let viewController = magazine.initialViewController
      viewController.modalTransitionStyle = .crossDissolve
      present(viewController, animated: true, completion: nil)
    }
  }
}

extension MagazinePickerViewController: DownloadManagerDelegate {
  func didMakeProgress(_ progress: Double, forIdentifier identifier: String) {
    guard let cell = collectionView.cellForItem(at: IndexPath(item: indexForIdentifier[identifier]!, section: 0)) as? MagazineCell else { return }
    cell.updateDownloadProgress(progress)
  }
  
  func didMakeUnzipProgress(_ progress: Double, forIdentifier identifier: String) {
    guard let cell = collectionView.cellForItem(at: IndexPath(item: indexForIdentifier[identifier]!, section: 0)) as? MagazineCell else { return }
    cell.updateUnzipProgress(progress)
  }
  
  func didComplete(identifier: String) {
    collectionView.reloadData()
  }
}

class MagazineCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var downloadCancelButton: UIButton!
  @IBOutlet weak var deleteButton: UIButton!
  @IBOutlet weak var progressContainer: UIView!
  @IBOutlet weak var progressWidthConstraint: NSLayoutConstraint!
  
  var magazine: Magazine! = nil
  var downloading: Bool = false {
    didSet { progressContainer.isHidden = !downloading }
  }
  
  func configure(magazine: Magazine) {
    self.magazine = magazine
    
    titleLabel.text = magazine.name
    
    if FileManager.default.fileExists(atPath: magazine.directory.path, isDirectory: nil) {
      downloadCancelButton.isHidden = true
      deleteButton.isHidden = false
    } else {
      downloadCancelButton.isHidden = false
      deleteButton.isHidden = true
    }
    
    let progress = DownloadManager.shared.progress[magazine.identifier]
    if progress != nil {
      downloadCancelButton.setTitle("cancel".localized(), for: .normal)
      downloading = true
    } else {
      downloadCancelButton.setTitle("download".localized(), for: .normal)
      downloading = false
    }
  }
  
  @IBAction func downloadCancelTapped(_ sender: UIButton) {
    if downloading {
      DownloadManager.shared.cancelDownload(magazine: magazine)
      downloading = false
      downloadCancelButton.setTitle("download".localized(), for: .normal)
    } else {
      DownloadManager.shared.startDownload(magazine: magazine)
      updateDownloadProgress(0.0)
      downloadCancelButton.setTitle("cancel".localized(), for: .normal)
      downloading = true
    }
  }
  
  @IBAction func deleteTapped(_ sender: UIButton) {
    let alertController = UIAlertController(title: "confirm".localized(), message: String(format: "confirm_delete".localized(), magazine.name), preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "no".localized(), style: .cancel, handler: nil))
    alertController.addAction(UIAlertAction(title: "yes".localized(), style: .destructive, handler: { (_) in
      try? FileManager.default.removeItem(at: self.magazine.directory)
      self.configure(magazine: self.magazine)
    }))
    
    (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.present(alertController, animated: true, completion: nil)
  }
  
  func updateDownloadProgress(_ progress: Double) {
    // Allow extra space at the end to account for unzipping
    let progress: Double = max(min(progress, 1.0),0.0)
    progressWidthConstraint.constant = (bounds.size.width - 10.0) * CGFloat(progress)
  }
  
  func updateUnzipProgress(_ progress: Double) {
    // Allow extra space at the end to account for unzipping
    let progress: Double = max(min(progress, 1.0),0.0)
    progressWidthConstraint.constant = (bounds.size.width - 10.0) + (10.0 * CGFloat(progress))
  }
}
