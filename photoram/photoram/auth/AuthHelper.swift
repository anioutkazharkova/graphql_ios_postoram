//
//  FirebaseAuthHelper.swift
//  photoram
//
//  Created by Anna Zharkova on 10.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation
import Apollo

class AuthHelper {
    static let shared = AuthHelper()
    private let apollo = HasuraClient.shared.apollo
    private weak var userStorage = DI.dataContainer.userStorage
    
    var currentUser: UserData? = nil
    
    //MARK: check authorization
    func checkAuth()->Bool {
        return currentUser != nil || userStorage?.getUser() != nil
    }
    
    func isAuthorized()->Bool {
        //Load session and check with saved
        return currentUser != nil || userStorage?.getUser() != nil
    }
    
    //MARK: Login
    func login(email: String, password: String, completion: @escaping(Result<UserData,Error>)->Void) {
        apollo.fetch(query:  QueryAdapter.shared.loginUserQuery(email: email, password: password)) { (result:Result<GraphQLResult<GetUserQuery.Data>,Error>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let userData):
                if let user = userData.data?.users.first {
                    let u = UserData(user: user)
                    self.userStorage?.saveUser(data: u)
                    completion(.success(u))
                   
                }
            }
        }
    }
    
    //MARK: registation
    func register(name: String, email: String, password: String, completion: @escaping(Result<UserData,Error>)->Void) {
        let query = QueryAdapter.shared.createUser(userData: UserData(uid: UUID().uuidString, name: name, email: email, password: password))
        apollo.perform(mutation: query){
            (result: Result<GraphQLResult<CreateUserMutationMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                print(error)
                completion(.failure( error))
            case .success(let data):
                if let user = data.data?.insertUsersOne?.fragments.user {
                    self.currentUser = UserData(user: user)
                    self.userStorage?.saveUser(data: self.currentUser!)
                    completion(.success(self.currentUser!))
                }
            }
        }
    }
}
