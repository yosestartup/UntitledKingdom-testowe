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
    private var startButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.tabBarController.
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.startButton)

        self.startButton.setTitle("START", for: .normal)
        self.startButton.addTarget(self, action: #selector(didClickStartButton), for: .touchUpInside)
        self.startButton.setTitleColor(UIColor.blue, for: .normal)
        self.startButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc private func didClickStartButton() {
        print("1")
    }
}
extension StartScreenViewController: StartScreenViewProtocol { }
