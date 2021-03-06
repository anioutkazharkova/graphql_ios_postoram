//
//  Like.swift
//  photoram
//
//  Created by Anna Zharkova on 11.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

struct LikeItem :Codable, Equatable {
    var userId: String
    var postId: String
    var date = Date()
    
    init(userId: String, postId: String) {
        self.userId = userId
        self.postId = postId
    }
    
    enum CodingKeys: String, CodingKey {
        case userId
        case postId
        //case date
    }
    
    static func == (lhs: LikeItem, rhs: LikeItem) -> Bool {
        return  lhs.userId == rhs.userId && lhs.postId == rhs.postId
       }
}
