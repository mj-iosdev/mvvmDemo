//
//  ViewControllerModel.swift
//  MVVPDemo
//
//  Created by Orange on 30/08/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import UIKit

protocol ViewControllerModelDelegate {
    func didStartFetchingMessage()
    func didFinishFetchingMessage(_ message: String?)
}

class ViewControllerModel {
    
    let user: User
    var delegate: ViewControllerModelDelegate?
    
    init(user: User) {
        self.user = user
    }
    
    func fetchMessage() {
        self.delegate?.didStartFetchingMessage()
        
        var message: String? = "Hello there"
        
        if(message == nil) {
            message = "Error"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.delegate?.didFinishFetchingMessage(message)
        }
    }
}
