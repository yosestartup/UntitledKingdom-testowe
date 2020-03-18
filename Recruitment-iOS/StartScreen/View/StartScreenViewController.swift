//
//  StartScreenViewController.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit
import SnapKit

class StartScreenViewController: BaseViewController {

    var presenter: StartScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {

    }
}
extension StartScreenViewController: StartScreenViewProtocol { }
