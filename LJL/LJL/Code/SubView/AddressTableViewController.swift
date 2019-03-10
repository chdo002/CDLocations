//
//  LocationTableViewController.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

/// 地点展示table
class LocationTableViewController: UITableViewController {

    var locations = [LJAnnotaionVM]()
    
    var delegate: BaseMapActionProtocal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = 40
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    func showLocations(_ points:[LJAnnotaionVM]) {
        locations = points
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let vm = locations[indexPath.row]
        if let apiModel = vm.apiModel {
            cell.textLabel?.text = apiModel.name
        } else if let dbModel  = vm.dbModel {
            cell.textLabel?.text = dbModel.ljModel?.info
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = locations[indexPath.row]
        delegate?.selectLocation(vm, from: self)
    }
}
