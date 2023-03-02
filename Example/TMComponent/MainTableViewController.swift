//
//  ViewController.swift
//  TMComponents
//
//  Created by Jason Zhang on 2023/2/21.
//

import UIKit

class mainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(TMTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TMTableViewCell
        cell.name = exampleViews[indexPath.row]
        cell.setupUI()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(exampleViewControllers[indexPath.row], animated: true)
    }
    func pushView(indexPath: Int) {
    }
    
    func setViewController() {
//        addChild(TMInfoViewController())
    }

}

