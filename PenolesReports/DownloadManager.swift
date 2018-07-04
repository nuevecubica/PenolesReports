//
//  DownloadManager.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/2/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import Foundation
import Zip

protocol DownloadManagerDelegate: class {
  func didMakeProgress(_ progress: Double, forIdentifier identifier: String)
  func didMakeUnzipProgress(_ progress: Double, forIdentifier identifier: String)
  func didComplete(identifier: String)
}

class DownloadManager: NSObject {
  static let shared = DownloadManager()
  
  weak var delegate: DownloadManagerDelegate? = nil
  
  weak var _downloadSesssion: URLSession? = nil
  weak var downloadsSession : URLSession? {
    get {
      if _downloadSesssion == nil {
        let config = URLSessionConfiguration.background(withIdentifier: "background")
        weak var queue = OperationQueue()
        _downloadSesssion = URLSession(configuration: config, delegate: self, delegateQueue: queue)
      }
      return _downloadSesssion
    }
  }
  
  var identifiers: [URLSessionDownloadTask: String] = [:]
  var directories: [String: URL] = [:]
  var progress: [String: Double] = [:]
  
  func startDownload(magazine: Magazine) {
    let resumeDataURL: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("\(magazine.identifier)-partial")
    
    var task: URLSessionDownloadTask! = nil
    if let data = try? Data(contentsOf: resumeDataURL) {
      task = downloadsSession?.downloadTask(withResumeData: data)
    } else {
      task = downloadsSession?.downloadTask(with: magazine.downloadURL)
    }
    
    try? FileManager.default.removeItem(at: resumeDataURL)
    
    guard task != nil else { return }
    identifiers[task] = magazine.identifier
    directories[magazine.identifier] = magazine.directory
    task.resume()
  }
  
  func cancelDownload(magazine: Magazine) {
    var downloadTask: URLSessionDownloadTask! = nil
    for (task, identifier) in identifiers {
      if identifier == magazine.identifier {
        downloadTask = task
      }
    }
    
    guard downloadTask != nil else { return }
    
    progress[magazine.identifier] = nil
    directories[magazine.identifier] = nil
    identifiers[downloadTask] = nil
    
    downloadTask.cancel { (resumeData) in
      if resumeData != nil {
        self.saveResumeData(identifier: magazine.identifier, data: resumeData!)
      }
    }
  }
  
  func saveResumeData(identifier: String, data: Data) {
    let resumeDataURL: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("\(identifier)-partial")
    try? data.write(to: resumeDataURL)
  }
}

extension DownloadManager: URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    guard let identifier = identifiers[downloadTask] else { return }
    let currentProgress = Double(totalBytesWritten)/Double(totalBytesExpectedToWrite)
    progress[identifier] = currentProgress
    
    DispatchQueue.main.async {
      self.delegate?.didMakeProgress(currentProgress, forIdentifier: identifier)
    }
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
    guard let identifier = identifiers[downloadTask] else { return }
    
    let currentProgress = Double(fileOffset)/Double(expectedTotalBytes)
    progress[identifier] = currentProgress
    
    DispatchQueue.main.async {
      self.delegate?.didMakeProgress(currentProgress, forIdentifier: identifier)
    }
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    guard let identifier = identifiers[downloadTask] else { return }
    
    defer {
      progress[identifier] = nil
      directories[identifier] = nil
      identifiers[downloadTask] = nil
      
      try? FileManager.default.removeItem(at: location)
      
      DispatchQueue.main.async {
        self.delegate?.didComplete(identifier: identifier)
      }
    }
    
    guard let directory = directories[identifier] else { return }
    try? Zip.unzipFile(location, destination: directory, overwrite: true, password: nil, progress: { (progress) -> () in
      DispatchQueue.main.async {
        self.delegate?.didMakeUnzipProgress(progress, forIdentifier: identifier)
      }
    })
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    // Success in handled in didFinishDownloadingTo
    guard error != nil else { return }
    
    let downloadTask = task as! URLSessionDownloadTask
    
    guard let identifier = identifiers[downloadTask] else { return }
    
    progress[identifier] = nil
    directories[identifier] = nil
    identifiers[downloadTask] = nil
    
    if let resumeData = (error as NSError?)?.userInfo[NSURLSessionDownloadTaskResumeData] as? Data {
      saveResumeData(identifier: identifier, data: resumeData)
    }
    
    DispatchQueue.main.async {
      self.delegate?.didComplete(identifier: identifier)
    }
  }
}
