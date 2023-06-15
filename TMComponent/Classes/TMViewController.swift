//
//  TMViewControllerExtension.swift
//  TennisMoment
//
//  Created by Jason Zhang on 2022/12/27.
//

import Foundation
import UIKit

/// TM基础VC
open class TMViewController: UIViewController {
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
        view.backgroundColor = UIColor(named: "BackgroundGray")
    }
}
