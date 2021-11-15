//
//  PostListPresenter.swift
//  photoram
//
//  Created by Anna Zharkova on 10.05.2021.
//  Copyright © 2021 azharkova. All rights reserved.
//

import Foundation

protocol IPostListPresenter {
    var view: PostListView? {get set}
    
    func liked(index: Int)
    
    func delete(index: Int)
    
    func requestForEdit(index: Int)
    
    func requestOpen(index: Int)
    
    func loadPosts()
}

class PostListPresenter : IPostListPresenter {
    weak var view: PostListView?
    private var posts: [PostItem] = [PostItem]()
    
    private weak var postService = DI.serviceContainer.postService
    
    static func setup(view: PostListView)->IPostListPresenter {
        let presenter = PostListPresenter()
        presenter.view = view
        return presenter
    }
    
    func loadPosts() {
        self.postService?.loadPosts { [weak self] (posts) in
            guard let self = self else {return}
            self.posts = [PostItem]()
            self.posts.append(contentsOf: posts)
            self.view?.setupPosts(items: self.posts)
        }
    }
    
    func liked(index: Int) {
        let item = posts[index]
        self.postService?.changeLike(postItem: item) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let posts):
                self.posts = [PostItem]()
                self.posts.append(contentsOf: posts)
                self.view?.setupPosts(items: self.posts)
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func requestForEdit(index: Int) {
        let item = self.posts[index]
        self.view?.openToCreate(post: item)
    }
    
    func requestOpen(index: Int) {
        let item = self.posts[index]
        self.view?.open(post: item)
    }
    
    func delete(index: Int) {
        let item = self.posts[index]
        self.postService?.deletePost(postId: item.uuid) {  [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
            case .success(_):
                self.loadPosts()
            }
        }
    }
}
