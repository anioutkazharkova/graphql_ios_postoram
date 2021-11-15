//
//  Post+Adapter.swift
//  graphql_photoram
//
//  Created by Anna Zharkova on 15.11.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

class QueryAdapter {
    static let shared = QueryAdapter()
    func loginUserQuery(email: String, password: String)-> GetUserQuery {
        return GetUserQuery(email: email, password: password)
    }
    
    func loginUserQuery(userData: UserData)-> GetUserQuery {
        return GetUserQuery(email: userData.email, password: userData.password)
    }
    
    func createUser(userData: UserData)->CreateUserMutationMutation {
        return CreateUserMutationMutation(name: userData.name,id: UUID().uuidString, email: userData.email, password: userData.password)
    }
    
    
    func createPost(postItem: PostItem)->AddPostMutationMutation {
        return AddPostMutationMutation(
            postId: UUID().uuidString,
            text: postItem.postText,
            image: postItem.imageLink , user: postItem.userName,
            userId: postItem.userId,
            date: "\(Date())")
    }
    
    func changeLike(postItem: PostItem)->ChangeLikeMutationMutation {
        let likes = postItem.likeItems.map{$0.userId}.joined(separator: ",")
        return  ChangeLikeMutationMutation(postId: postItem.uuid, likes: likes)
    }
    
    func changePost(postItem: PostItem)->ChangePostMutationMutation {
        return ChangePostMutationMutation(postId: postItem.uuid, postText: postItem.postText,imageLink: postItem.imageLink)
    }
    func deletePost(postItem: PostItem)-> DeletePostMutation {
        return DeletePostMutation(postId: postItem.uuid)
    }
    
    func deletePostBy(postId: String)-> DeletePostMutation {
        return DeletePostMutation(postId: postId)
    }
    
    func createComment(commentItem: CommentItem)->CreateCommentMutation {
        return CreateCommentMutation(postId: commentItem.postId, commentText: commentItem.text, id: UUID().uuidString, userId: commentItem.userId,userName: commentItem.userName)
    }
}

