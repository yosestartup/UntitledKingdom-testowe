//
//  DetailsViewController.swift
//  Recruitment-iOS
//
//  Created by Oleksandr Bambuliak on 18/03/2020.
//  Copyright © 2020 Oleksandr Bambuliak. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: BaseViewController {

    var presenter: DetailsPresenterProtocol!
    private var textLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.viewLoaded()
    }
    
    private func createUI() {
        
        self.view.addSubview(self.textLabel)
        
        self.textLabel.text = "Loading..."
        self.textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
        }
    }
}
extension DetailsViewController: DetailsViewProtocol {
    func setBackroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func setTitle(title: String) {
        self.title = title
    }
}
