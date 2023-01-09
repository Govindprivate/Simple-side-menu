//
//  MenuViewController.swift
//  sidemenu
//
//  Created by GOVIND KUMAR on 09/01/23.
//

import UIKit

class MenuViewController: UIViewController {
    // MARK: - IBOutlet's ...
    @IBOutlet weak var tableViewObject: UITableView!
  
    // MARK: - Variable's ...
    var isLeftMenu = true
    
    // MARK: - View lifecycle method's...
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moveIn()
    }
    
    // MARK: - Required method's ...
    func moveIn() {
        self.view.backgroundColor = UIColor.clear
        self.view.frame = UIScreen.main.bounds
        if isLeftMenu{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            self.view.frame.origin = CGPoint(x: UIScreen.main.bounds.width * -1, y: 0)
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.view.frame.origin = CGPoint(x: UIScreen.main.bounds.width * 1, y: 0)
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame = UIScreen.main.bounds
        }) { _ in
            self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        }
    }
    func moveOut() {
        self.view.backgroundColor = UIColor.clear
               UIView.animate(withDuration: 0.2, animations: {
                   if self.isLeftMenu{
                       UIView.appearance().semanticContentAttribute = .forceLeftToRight
                       self.view.frame.origin = CGPoint(x: UIScreen.main.bounds.width * -1, y: 0)
                   }else{
                       UIView.appearance().semanticContentAttribute = .forceLeftToRight
                       self.view.frame.origin = CGPoint(x: UIScreen.main.bounds.width * 1, y: 0)
                   }
               }) { _ in
                   self.view.removeFromSuperview()
               }
    }

    // MARK: - Action's...
    @IBAction func actionHideMenu(_ sender: Any) {
        moveOut()
    }
    
}
// MARK: - UITableViewDelegate & UITableViewDataSource method's ...
extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewObject.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        if indexPath.row == 0{
            cell.labelTitle.text = "Red"
        }else{
            cell.labelTitle.text = "Black"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveOut()
        if indexPath.row == 0{
            let object = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RedViewController") as! RedViewController
            self.navigationController?.pushViewController(object, animated: true)
        }else{
            let object = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BlackViewController") as! BlackViewController
            self.navigationController?.pushViewController(object, animated: true)
        }
    }
}
