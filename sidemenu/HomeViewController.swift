//
//  HomeViewController.swift
//  sidemenu
//
//  Created by GOVIND KUMAR on 09/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - View lifecycle method's...
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Required method's...
    func openSideMenu(_ isLeftMenu:Bool = true){
        let menuObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuObject.isLeftMenu = isLeftMenu
        self.addChild(menuObject)
        self.view.addSubview(menuObject.view)
        menuObject.didMove(toParent: self)
    }
    
    // MARK: - Action's...
    @IBAction func actionLeftMenu(_ sender: Any) {
        openSideMenu(true)
    }
    
    @IBAction func actionRightMenu(_ sender: Any) {
        openSideMenu(false)
    }
}

