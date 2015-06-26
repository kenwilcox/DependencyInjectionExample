//
//  ViewController.swift
//  DependencyInjectionExample
//
//  Created by Kenneth Wilcox on 6/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var dataSource: [Minion]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //fetchMinions()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    fetchMinions()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func fetchMinions(minionService: MinionService = MinionService()) {
    minionService.getTheMinions { (minionDataResult) -> Void in
      switch(minionDataResult) {
      case .Success(let minionsData):
        self.dataSource = minionsData
        self.tableView.reloadData()
      case .Failure(let error):
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Oh Snap!", style: .Cancel, handler: nil)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
      }
    }
  }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("minionCell") as! UITableViewCell
    
    if let minion = dataSource?[indexPath.row] {
      cell.textLabel?.text = minion.name
      cell.imageView?.image = UIImage(named: minion.name)
    }
    return cell
  }
}
