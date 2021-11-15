//
//  Posst.swift
//  photoram
//
//  Created by Anna Zharkova on 10.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

struct PostItem : Codable, Equatable  {
    var id: String? = ""
    var uuid: String = UUID().uuidString.lowercased()
    var imageLink: String = ""
    var postText: String = ""
    var date = Date()
    var userId: String = ""
    var userName: String = ""
    var likeItems: [LikeItem] = [LikeItem]()
    var dateString: String? = nil
    
    init() {}
    init(imageLink: String, postText: String){
        self.imageLink = imageLink
        self.postText = postText
    }
    
    init(data: Post) {
        self.uuid = data.postId
        self.postText = data.postText ?? ""
        self.id = data.postId
        self.imageLink = data.imageLink ?? ""
        self.userId = data.userId ?? ""
        self.userName = data.userName ?? ""
        self.likeItems = data.likes?.split(separator: ",").map{LikeItem(userId: String($0), postId: data.postId)} ?? [LikeItem]()
        self.dateString = data.date
    }
    
    init(data: PostsQueryQuery.Data.Post) {
        self.postText = data.postText ?? ""
        self.id = data.postId
        self.uuid = data.postId
        self.imageLink = data.imageLink ?? ""
        self.userId = data.userId ?? ""
        self.userName = data.userName ?? ""
        self.likeItems = data.likes?.split(separator: ",").map{LikeItem(userId: String($0), postId: data.postId)} ?? [LikeItem]()
        self.dateString = data.date
    }
    
    init(data: GetPostQueryQuery.Data.Post) {
        self.postText = data.postText ?? ""
        self.id = data.postId
        self.uuid = data.postId
        self.imageLink = data.imageLink ?? ""
        self.userId = data.userId ?? ""
        self.userName = data.userName ?? ""
        self.likeItems = data.likes?.split(separator: ",").map{LikeItem(userId: String($0), postId: data.postId)} ?? [LikeItem]()
        self.dateString = data.date
    }
    
    var likes: Int {
        return likeItems.count
    }
    
    var isLiked: Bool = false 
    
    mutating func updateLikes(likes: [LikeItem]) {
        likeItems = [LikeItem]()
        likeItems.append(contentsOf: likes)
    }
    
    mutating func update(with item: PostItem) {
        self.imageLink = item.imageLink
        self.postText = item.postText
        updateLikes(likes: item.likeItems)
    }
    
    static func == (lhs: PostItem, rhs: PostItem) -> Bool {
        return  lhs.uuid == rhs.uuid
    }
}

extension PostItem {
    func createPost()->AddPostMutationMutation {
        return QueryAdapter.shared.createPost(postItem: self)
    }
    
    func changeLike()->ChangeLikeMutationMutation {
        return QueryAdapter.shared.changeLike(postItem: self)
    }
    
    func changePost()->ChangePostMutationMutation {
        return QueryAdapter.shared.changePost(postItem: self)
    }
    func deletePost()-> DeletePostMutation {
        return QueryAdapter.shared.deletePost(postItem: self)
    }
    
    func deletePostById()-> DeletePostMutation {
        return QueryAdapter.shared.deletePostBy(postId: self.uuid ?? "")
    }
}
