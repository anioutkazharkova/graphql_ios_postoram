//
//  UserData.swift
//  photoram
//
//  Created by Anna Zharkova on 23.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

struct UserData : Codable {
    var uid: String = ""
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case email
    }
    
    init() {}
    init(uid: String, name: String, email: String, password: String = "") {
        self.uid = uid
        self.name = name
        self.email = email
        self.password = password
    }
    
    init(user: User) {
        self.uid = user.userId
        self.name = user.userName
        self.email = user.userEmail
    }
    
    init(user: GetUserQuery.Data.User) {
        self.uid = user.userId
        self.name = user.userName
        self.email = user.userEmail
    }
}

extension UserData {
    func createUser(userData: UserData)->CreateUserMutationMutation {
        return QueryAdapter.shared.createUser(userData: self)
    }
}
