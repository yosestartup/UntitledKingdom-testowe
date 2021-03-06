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
    private var descriptionLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.viewLoaded()
    }
    
    private func createUI() {
        
        self.view.addSubview(self.descriptionLabel)
        
        self.descriptionLabel.text = "Loading..."
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

extension DetailsViewController: DetailsViewProtocol {
    func setDescriptionWith(text: String) {
        self.descriptionLabel.text = text
    }
    
    func setBackroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
}
