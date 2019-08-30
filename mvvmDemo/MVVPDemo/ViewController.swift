//
//  ViewController.swift
//  MVVPDemo
//
//  Created by Orange on 30/08/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

    var viewModel: ViewControllerModel! {
        didSet {
            self.view.backgroundColor = viewModel.user.backgroundColor
            self.navigationItem.title = viewModel.user.name
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Tap 'Fetch' to retrive message"
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigation()
        self.setupView()
        
        let user: User = User(name: "Alex", age: 36, backgroundColor: .white)
        self.viewModel = ViewControllerModel(user: user)
        self.viewModel.delegate = self
    }
    
    fileprivate func setupNavigation() {
        
        //self.navigationItem.title = "Alex,36"
        
        let resetButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetButtonItemTapped))
        
        let fetchButtonItem = UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(fetchButtonItemTapped))
        self.navigationItem.setLeftBarButton(resetButtonItem, animated: false)
        self.navigationItem.setRightBarButton(fetchButtonItem, animated: false)
    }
    
    @objc fileprivate func resetButtonItemTapped() {
        self.label.text = "Tap 'Fetch' to retrive message"
    }
    
    @objc fileprivate func fetchButtonItemTapped() {
        self.viewModel.fetchMessage()
    }
    
    fileprivate func setupView() {
        self.view.addSubview(self.label)
        self.view.addSubview(self.activityIndicator)
        
        self.label.centerInSuperview()
        self.activityIndicator.topToBottom(of: self.label, offset: 12)
        self.activityIndicator.centerXToSuperview()
    }

}

extension ViewController: ViewControllerModelDelegate {
    func didStartFetchingMessage() {
        self.label.text = "Retriving from server"
        self.activityIndicator.startAnimating()
    }
    
    func didFinishFetchingMessage(_ message: String?) {
        self.label.text = message
        self.activityIndicator.stopAnimating()
    }
}

