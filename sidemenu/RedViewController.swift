//
//  RedViewController.swift
//  sidemenu
//
//  Created by GOVIND KUMAR on 09/01/23.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - Action's...
    @IBAction func actionHideMenu(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
