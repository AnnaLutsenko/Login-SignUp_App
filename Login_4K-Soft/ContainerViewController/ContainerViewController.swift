//
//  MenuViewController.swift
//  Login_4K-Soft
//
//  Created by Anna on 11.12.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var leadingMenuConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewController()
    }
    
    func initViewController() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Команды"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"menuBtn"), style: .plain, target: self, action: #selector(menuBtnTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"add"), style: .plain, target: self, action: #selector(addBtnTapped))
        
    }
    
    static func storyboardInstance() -> ContainerViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        return vc
    }
    
    @objc func menuBtnTapped() {
        if leadingMenuConstraint.constant == 0 {
            leadingMenuConstraint.constant = self.view.frame.size.width / 1.5
        } else {
            leadingMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func addBtnTapped() {
        
    }
}
