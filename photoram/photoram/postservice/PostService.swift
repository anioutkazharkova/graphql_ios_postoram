//
//  PostService.swift
//  photoram
//
//  Created by Anna Zharkova on 11.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation
import Apollo
import simd

class PostService {
    private let apollo = HasuraClient.shared.apollo
    static let shared = PostService()
    private weak var userStorage = DI.dataContainer.userStorage
    var currentPosts: [PostItem] = [PostItem]()
    
    //MARK: post
    func publishPost(item: PostItem, completion: @escaping(Result<Bool, Error>)->Void) {
        guard let user = userStorage?.getUser() else {
            return
        }
        var postItem = item
        postItem.userId = user.uid
        postItem.userName = user.name
        apollo.perform(mutation: QueryAdapter.shared.createPost(postItem: postItem)) {
            (result: Result<GraphQLResult<AddPostMutationMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                completion(.success(true))
            }
        }
    }

    func updatePost(item: PostItem, completion: @escaping(Result<Bool, Error>)->Void) {
        guard let user = userStorage?.getUser(), item.userId == user.uid else {
            return
        }
        
        let mutation = QueryAdapter.shared.changePost(postItem: item)
        apollo.perform(mutation: mutation) {
            (result: Result<GraphQLResult<ChangePostMutationMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                completion(.success(true))
            }
        }
    }

    func deletePost(postId: String,completion: @escaping(Result<Bool, Error>)->Void) {
        let mutation = QueryAdapter.shared.deletePostBy(postId: postId)
        apollo.perform(mutation: mutation) {
            (result: Result<GraphQLResult<DeletePostMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                completion(.success(true))
            }
        }
    }
    
    //MARK: posts
    func loadPosts(completion: @escaping([PostItem])->Void) {
        apollo.fetch(query: PostsQueryQuery()){ [weak self]
            (result:Result<GraphQLResult<PostsQueryQuery.Data>,Error>) in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
               print(error)
            case .success(let data):
                let posts =   data.data?.posts.map{PostItem(data: $0)} ?? [PostItem]()
                completion(self.checkLiked(posts: posts))
            }
        }
    }

    private func checkLiked(posts: [PostItem])->[PostItem] {
        var tempPosts = posts
        guard let userId = userStorage?.getUser()?.uid.lowercased() else {
            return posts
        }
        for i in 0..<tempPosts.count {
            let postLikes  = tempPosts[i].likeItems
            tempPosts[i].isLiked = (postLikes .filter{$0.userId.lowercased() == userId}).count > 0
        }
        return tempPosts
    }

    
    
    func changeLike(postItem: PostItem, completion: @escaping(Result<[PostItem],Error>)->Void) {
        guard let userId  = userStorage?.getUser()?.uid else {
            return
        }
        var likeItems = postItem.likeItems
            if let found = likeItems.filter({$0.userId == userId}).first {
                likeItems.remove(item: found)
            } else {
            likeItems.append(LikeItem(userId: userId, postId: postItem.uuid))
        }
        let mutation = ChangeLikeMutationMutation(postId: postItem.uuid.lowercased(), likes: likeItems.map{$0.userId}.joined(separator: ","))
        apollo.perform(mutation: mutation) {
            (result: Result< GraphQLResult<ChangeLikeMutationMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                self.loadPosts { items in
                    completion(.success(items))
                }
            }
        }
    }
    
    //MARK: comments
    func publishComment(item: CommentItem, completion: @escaping(Result<Bool, Error>)->Void) {
        var comment = item
        guard let user = userStorage?.getUser() else {
            return
        }
        comment.userId = user.uid
        comment.userName = user.name
        let mutation = item.createComment()
        apollo.perform(mutation: mutation) {
            (result: Result<GraphQLResult<CreateCommentMutation.Data>,Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(_):
                completion(.success(true))
                
            }
        }
    }
    
    func loadComments(postId: String, completion: @escaping(Result<[CommentItem], Error>)->Void) {
        let query = CommentsQuery(commentId: postId)
        apollo.fetch(query: query) {
            (result: Result<GraphQLResult<CommentsQuery.Data>,Error>) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                let comments = data.data?.comments.map{
                    CommentItem(comment: $0)
                } ?? [CommentItem]()
                completion(.success(comments))
            }
        }
    }
}
