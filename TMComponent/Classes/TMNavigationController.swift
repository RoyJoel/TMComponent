//
//  TMNavigationController.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/6/15.
//

import Foundation
import UIKit

 open class TMNavigationController: UINavigationController {
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = UIColor(named: "ContentBackground")
    }
 }
