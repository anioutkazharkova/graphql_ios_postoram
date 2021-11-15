//
//  CommentItem.swift
//  photoram
//
//  Created by Anna Zharkova on 25.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

struct CommentItem : Codable {
    var uuid = UUID().uuidString.lowercased()
    var text: String = ""
    var date = Date()
    var dateString: String? = nil
    var userId: String = ""
    var userName: String = ""
    var postId: String = ""
    
    init(text: String, postId: String){
        self.text = text
        self.postId = postId
    }
    
   init(comment: Comment) {
        self.userId = comment.userId
        self.postId = comment.postId
        self.userName = comment.userName ?? ""
        self.text = comment.commentText
        self.uuid = comment.commentId
    }
    
    init(comment: CommentsQuery.Data.Comment) {
         self.userId = comment.userId
         self.postId = comment.postId
         self.userName = comment.userName ?? ""
         self.text = comment.commentText
         self.uuid = comment.commentId
     }
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case text
        case date
        case userId
        case userName
        case postId
    }
    
    var info: String {
        return "\(userName), \(date.defaultText)"
    }
}

extension CommentItem {
    func createComment()->CreateCommentMutation {
        return QueryAdapter.shared.createComment(commentItem: self)
    }
}

