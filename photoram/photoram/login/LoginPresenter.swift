//
//  LoginPresenter.swift
//  photoram
//
//  Created by Anna Zharkova on 10.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

protocol ILoginPresenter {
    var view: LoginView? {get set}
    
    func login(email: String, password: String)
    
    func checkLogin()
}

class LoginPresenter: ILoginPresenter {
    weak var view: LoginView?
    
    static func setup(view: LoginView)->ILoginPresenter {
        let presenter = LoginPresenter()
        presenter.view = view
        return presenter
    }
    
    func checkLogin() {
        if AuthHelper.shared.isAuthorized() {
            self.view?.showPosts()
        }
    }
    
    func login(email: String, password: String) {
        AuthHelper.shared.login(email: email, password: password) { result in
            self.view?.showPosts()
        }
    }
}
