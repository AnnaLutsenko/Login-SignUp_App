//
//  NavigationMenuViewController.swift
//  Login_4K-Soft
//
//  Created by Anna on 14.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class NavigationMenuViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let navigationTitles = ["Константин", "Рабочие группы", "Календарь", "Сообщения", "Уведомления", "Настройки", "Поддержка"]
    let imgNames = ["account", "work group", "calendar", "message", "notification", "settings", "support"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    func initViewController() {
        searchBar.barTintColor = UIColor.init(hex: Constant.Color.lightGray)
        tableView.separatorStyle = .none
    }
}

extension NavigationMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return navigationTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.navMenu, for: indexPath) as! NavMenuTableViewCell
        
        cell.iconImg.image = UIImage.init(named: imgNames[indexPath.row])
        cell.titleLbl.text = navigationTitles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
