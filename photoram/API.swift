// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PostsQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PostsQuery {
      posts {
        __typename
        post_id
        post_text
        user_id
        user_name
        likes
        date
        image_link
      }
    }
    """

  public let operationName: String = "PostsQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("posts", type: .nonNull(.list(.nonNull(.object(Post.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(posts: [Post]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "posts": posts.map { (value: Post) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "posts"
    public var posts: [Post] {
      get {
        return (resultMap["posts"] as! [ResultMap]).map { (value: ResultMap) -> Post in Post(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Post) -> ResultMap in value.resultMap }, forKey: "posts")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_text", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("likes", type: .scalar(String.self)),
          GraphQLField("date", type: .scalar(String.self)),
          GraphQLField("image_link", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String, postText: String? = nil, userId: String? = nil, userName: String? = nil, likes: String? = nil, date: String? = nil, imageLink: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "posts", "post_id": postId, "post_text": postText, "user_id": userId, "user_name": userName, "likes": likes, "date": date, "image_link": imageLink])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var postText: String? {
        get {
          return resultMap["post_text"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_text")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var likes: String? {
        get {
          return resultMap["likes"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var date: String? {
        get {
          return resultMap["date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var imageLink: String? {
        get {
          return resultMap["image_link"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image_link")
        }
      }
    }
  }
}

public final class AddPostMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddPostMutation($postId: uuid, $text: String, $image: String, $user: String, $userId: uuid, $date: date) {
      insert_posts_one(
        object: {date: $date, image_link: $image, post_id: $postId, post_text: $text, user_id: $userId, user_name: $user}
      ) {
        __typename
        ...Post
      }
    }
    """

  public let operationName: String = "AddPostMutation"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Post.fragmentDefinition)
    return document
  }

  public var postId: String?
  public var text: String?
  public var image: String?
  public var user: String?
  public var userId: String?
  public var date: String?

  public init(postId: String? = nil, text: String? = nil, image: String? = nil, user: String? = nil, userId: String? = nil, date: String? = nil) {
    self.postId = postId
    self.text = text
    self.image = image
    self.user = user
    self.userId = userId
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "text": text, "image": image, "user": user, "userId": userId, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_posts_one", arguments: ["object": ["date": GraphQLVariable("date"), "image_link": GraphQLVariable("image"), "post_id": GraphQLVariable("postId"), "post_text": GraphQLVariable("text"), "user_id": GraphQLVariable("userId"), "user_name": GraphQLVariable("user")]], type: .object(InsertPostsOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertPostsOne: InsertPostsOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_posts_one": insertPostsOne.flatMap { (value: InsertPostsOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "posts"
    public var insertPostsOne: InsertPostsOne? {
      get {
        return (resultMap["insert_posts_one"] as? ResultMap).flatMap { InsertPostsOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_posts_one")
      }
    }

    public struct InsertPostsOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(Post.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String, postText: String? = nil, userId: String? = nil, userName: String? = nil, likes: String? = nil, date: String? = nil, imageLink: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "posts", "post_id": postId, "post_text": postText, "user_id": userId, "user_name": userName, "likes": likes, "date": date, "image_link": imageLink])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var post: Post {
          get {
            return Post(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class DeletePostMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeletePost($postId: uuid!) {
      delete_posts_by_pk(post_id: $postId) {
        __typename
        post_id
      }
      delete_comments(where: {post_id: {_eq: $postId}}) {
        __typename
        returning {
          __typename
          comment_id
        }
      }
    }
    """

  public let operationName: String = "DeletePost"

  public var postId: String

  public init(postId: String) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_posts_by_pk", arguments: ["post_id": GraphQLVariable("postId")], type: .object(DeletePostsByPk.selections)),
        GraphQLField("delete_comments", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]]], type: .object(DeleteComment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deletePostsByPk: DeletePostsByPk? = nil, deleteComments: DeleteComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "delete_posts_by_pk": deletePostsByPk.flatMap { (value: DeletePostsByPk) -> ResultMap in value.resultMap }, "delete_comments": deleteComments.flatMap { (value: DeleteComment) -> ResultMap in value.resultMap }])
    }

    /// delete single row from the table: "posts"
    public var deletePostsByPk: DeletePostsByPk? {
      get {
        return (resultMap["delete_posts_by_pk"] as? ResultMap).flatMap { DeletePostsByPk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_posts_by_pk")
      }
    }

    /// delete data from the table: "comments"
    public var deleteComments: DeleteComment? {
      get {
        return (resultMap["delete_comments"] as? ResultMap).flatMap { DeleteComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_comments")
      }
    }

    public struct DeletePostsByPk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String) {
        self.init(unsafeResultMap: ["__typename": "posts", "post_id": postId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }
    }

    public struct DeleteComment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["comments_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "comments_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["comments"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("comment_id", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(commentId: String) {
          self.init(unsafeResultMap: ["__typename": "comments", "comment_id": commentId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var commentId: String {
          get {
            return resultMap["comment_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment_id")
          }
        }
      }
    }
  }
}

public final class UsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Users {
      users {
        __typename
        user_email
        user_id
        user_name
      }
    }
    """

  public let operationName: String = "Users"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("users", type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "users": users.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "users"
    public var users: [User] {
      get {
        return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_email", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userEmail: String, userId: String, userName: String) {
        self.init(unsafeResultMap: ["__typename": "users", "user_email": userEmail, "user_id": userId, "user_name": userName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userEmail: String {
        get {
          return resultMap["user_email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userName: String {
        get {
          return resultMap["user_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }
    }
  }
}

public final class GetPostQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetPostQuery($postId: uuid) {
      posts(where: {post_id: {_eq: $postId}}) {
        __typename
        post_id
        post_text
        user_id
        user_name
        likes
        date
        image_link
      }
      likes(where: {post_id: {_eq: $postId}}) {
        __typename
        post_id
        user_id
      }
      comments(where: {post_id: {_eq: $postId}}) {
        __typename
        comment_id
        comment_text
        user_id
        post_id
        user_name
      }
    }
    """

  public let operationName: String = "GetPostQuery"

  public var postId: String?

  public init(postId: String? = nil) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("posts", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Post.selections))))),
        GraphQLField("likes", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Like.selections))))),
        GraphQLField("comments", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Comment.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(posts: [Post], likes: [Like], comments: [Comment]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "posts": posts.map { (value: Post) -> ResultMap in value.resultMap }, "likes": likes.map { (value: Like) -> ResultMap in value.resultMap }, "comments": comments.map { (value: Comment) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "posts"
    public var posts: [Post] {
      get {
        return (resultMap["posts"] as! [ResultMap]).map { (value: ResultMap) -> Post in Post(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Post) -> ResultMap in value.resultMap }, forKey: "posts")
      }
    }

    /// fetch data from the table: "likes"
    public var likes: [Like] {
      get {
        return (resultMap["likes"] as! [ResultMap]).map { (value: ResultMap) -> Like in Like(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Like) -> ResultMap in value.resultMap }, forKey: "likes")
      }
    }

    /// fetch data from the table: "comments"
    public var comments: [Comment] {
      get {
        return (resultMap["comments"] as! [ResultMap]).map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Comment) -> ResultMap in value.resultMap }, forKey: "comments")
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_text", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("likes", type: .scalar(String.self)),
          GraphQLField("date", type: .scalar(String.self)),
          GraphQLField("image_link", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String, postText: String? = nil, userId: String? = nil, userName: String? = nil, likes: String? = nil, date: String? = nil, imageLink: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "posts", "post_id": postId, "post_text": postText, "user_id": userId, "user_name": userName, "likes": likes, "date": date, "image_link": imageLink])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var postText: String? {
        get {
          return resultMap["post_text"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_text")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var likes: String? {
        get {
          return resultMap["likes"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var date: String? {
        get {
          return resultMap["date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var imageLink: String? {
        get {
          return resultMap["image_link"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image_link")
        }
      }
    }

    public struct Like: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["likes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String, userId: String) {
        self.init(unsafeResultMap: ["__typename": "likes", "post_id": postId, "user_id": userId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["comments"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment_text", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentId: String, commentText: String, userId: String, postId: String, userName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "comments", "comment_id": commentId, "comment_text": commentText, "user_id": userId, "post_id": postId, "user_name": userName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentId: String {
        get {
          return resultMap["comment_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment_id")
        }
      }

      public var commentText: String {
        get {
          return resultMap["comment_text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment_text")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }
    }
  }
}

public final class CreateUserMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateUserMutation($name: String, $id: uuid, $email: String, $password: String) {
      insert_users_one(
        object: {user_email: $email, user_id: $id, user_name: $name, password: $password}
      ) {
        __typename
        ...User
      }
    }
    """

  public let operationName: String = "CreateUserMutation"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + User.fragmentDefinition)
    return document
  }

  public var name: String?
  public var id: String?
  public var email: String?
  public var password: String?

  public init(name: String? = nil, id: String? = nil, email: String? = nil, password: String? = nil) {
    self.name = name
    self.id = id
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["name": name, "id": id, "email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_users_one", arguments: ["object": ["user_email": GraphQLVariable("email"), "user_id": GraphQLVariable("id"), "user_name": GraphQLVariable("name"), "password": GraphQLVariable("password")]], type: .object(InsertUsersOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertUsersOne: InsertUsersOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_users_one": insertUsersOne.flatMap { (value: InsertUsersOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "users"
    public var insertUsersOne: InsertUsersOne? {
      get {
        return (resultMap["insert_users_one"] as? ResultMap).flatMap { InsertUsersOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_users_one")
      }
    }

    public struct InsertUsersOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(User.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userEmail: String, userId: String, userName: String, likes: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "users", "user_email": userEmail, "user_id": userId, "user_name": userName, "likes": likes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var user: User {
          get {
            return User(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUser($email: String, $password: String) {
      users(where: {password: {_eq: $password}, user_email: {_eq: $email}}) {
        __typename
        user_email
        user_id
        user_name
      }
    }
    """

  public let operationName: String = "GetUser"

  public var email: String?
  public var password: String?

  public init(email: String? = nil, password: String? = nil) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("users", arguments: ["where": ["password": ["_eq": GraphQLVariable("password")], "user_email": ["_eq": GraphQLVariable("email")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "users": users.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "users"
    public var users: [User] {
      get {
        return (resultMap["users"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_email", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userEmail: String, userId: String, userName: String) {
        self.init(unsafeResultMap: ["__typename": "users", "user_email": userEmail, "user_id": userId, "user_name": userName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userEmail: String {
        get {
          return resultMap["user_email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userName: String {
        get {
          return resultMap["user_name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }
    }
  }
}

public final class LikesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Likes($postId: uuid) {
      likes(where: {post_id: {_eq: $postId}}) {
        __typename
        post_id
        user_id
      }
    }
    """

  public let operationName: String = "Likes"

  public var postId: String?

  public init(postId: String? = nil) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("likes", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Like.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likes: [Like]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "likes": likes.map { (value: Like) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "likes"
    public var likes: [Like] {
      get {
        return (resultMap["likes"] as! [ResultMap]).map { (value: ResultMap) -> Like in Like(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Like) -> ResultMap in value.resultMap }, forKey: "likes")
      }
    }

    public struct Like: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["likes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(postId: String, userId: String) {
        self.init(unsafeResultMap: ["__typename": "likes", "post_id": postId, "user_id": userId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }
    }
  }
}

public final class CommentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Comments($commentId: uuid) {
      comments(where: {post_id: {_eq: $commentId}}) {
        __typename
        comment_id
        comment_text
        user_id
        post_id
        user_name
      }
    }
    """

  public let operationName: String = "Comments"

  public var commentId: String?

  public init(commentId: String? = nil) {
    self.commentId = commentId
  }

  public var variables: GraphQLMap? {
    return ["commentId": commentId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("comments", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("commentId")]]], type: .nonNull(.list(.nonNull(.object(Comment.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comments: [Comment]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "comments": comments.map { (value: Comment) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "comments"
    public var comments: [Comment] {
      get {
        return (resultMap["comments"] as! [ResultMap]).map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Comment) -> ResultMap in value.resultMap }, forKey: "comments")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["comments"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment_text", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentId: String, commentText: String, userId: String, postId: String, userName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "comments", "comment_id": commentId, "comment_text": commentText, "user_id": userId, "post_id": postId, "user_name": userName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentId: String {
        get {
          return resultMap["comment_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment_id")
        }
      }

      public var commentText: String {
        get {
          return resultMap["comment_text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment_text")
        }
      }

      public var userId: String {
        get {
          return resultMap["user_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var postId: String {
        get {
          return resultMap["post_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "post_id")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }
    }
  }
}

public final class ChangeLikeMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ChangeLikeMutation($postId: uuid, $likes: String) {
      update_posts(where: {post_id: {_eq: $postId}}, _set: {likes: $likes}) {
        __typename
      }
    }
    """

  public let operationName: String = "ChangeLikeMutation"

  public var postId: String?
  public var likes: String?

  public init(postId: String? = nil, likes: String? = nil) {
    self.postId = postId
    self.likes = likes
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "likes": likes]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_posts", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]], "_set": ["likes": GraphQLVariable("likes")]], type: .object(UpdatePost.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePosts: UpdatePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "update_posts": updatePosts.flatMap { (value: UpdatePost) -> ResultMap in value.resultMap }])
    }

    /// update data of the table: "posts"
    public var updatePosts: UpdatePost? {
      get {
        return (resultMap["update_posts"] as? ResultMap).flatMap { UpdatePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_posts")
      }
    }

    public struct UpdatePost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init() {
        self.init(unsafeResultMap: ["__typename": "posts_mutation_response"])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }
    }
  }
}

public final class ChangePostMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ChangePostMutation($postId: uuid!, $postText: String, $imageLink: String) {
      update_posts(
        where: {post_id: {_eq: $postId}}
        _set: {post_text: $postText, image_link: $imageLink}
      ) {
        __typename
      }
    }
    """

  public let operationName: String = "ChangePostMutation"

  public var postId: String
  public var postText: String?
  public var imageLink: String?

  public init(postId: String, postText: String? = nil, imageLink: String? = nil) {
    self.postId = postId
    self.postText = postText
    self.imageLink = imageLink
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "postText": postText, "imageLink": imageLink]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_posts", arguments: ["where": ["post_id": ["_eq": GraphQLVariable("postId")]], "_set": ["post_text": GraphQLVariable("postText"), "image_link": GraphQLVariable("imageLink")]], type: .object(UpdatePost.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePosts: UpdatePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "update_posts": updatePosts.flatMap { (value: UpdatePost) -> ResultMap in value.resultMap }])
    }

    /// update data of the table: "posts"
    public var updatePosts: UpdatePost? {
      get {
        return (resultMap["update_posts"] as? ResultMap).flatMap { UpdatePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_posts")
      }
    }

    public struct UpdatePost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["posts_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init() {
        self.init(unsafeResultMap: ["__typename": "posts_mutation_response"])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }
    }
  }
}

public final class CreateCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateComment($postId: uuid, $commentText: String, $id: uuid, $userId: uuid, $userName: String) {
      insert_comments_one(
        object: {post_id: $postId, comment_text: $commentText, comment_id: $id, user_id: $userId, user_name: $userName}
      ) {
        __typename
        ...Comment
      }
    }
    """

  public let operationName: String = "CreateComment"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Comment.fragmentDefinition)
    return document
  }

  public var postId: String?
  public var commentText: String?
  public var id: String?
  public var userId: String?
  public var userName: String?

  public init(postId: String? = nil, commentText: String? = nil, id: String? = nil, userId: String? = nil, userName: String? = nil) {
    self.postId = postId
    self.commentText = commentText
    self.id = id
    self.userId = userId
    self.userName = userName
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "commentText": commentText, "id": id, "userId": userId, "userName": userName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_comments_one", arguments: ["object": ["post_id": GraphQLVariable("postId"), "comment_text": GraphQLVariable("commentText"), "comment_id": GraphQLVariable("id"), "user_id": GraphQLVariable("userId"), "user_name": GraphQLVariable("userName")]], type: .object(InsertCommentsOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertCommentsOne: InsertCommentsOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_comments_one": insertCommentsOne.flatMap { (value: InsertCommentsOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "comments"
    public var insertCommentsOne: InsertCommentsOne? {
      get {
        return (resultMap["insert_comments_one"] as? ResultMap).flatMap { InsertCommentsOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_comments_one")
      }
    }

    public struct InsertCommentsOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["comments"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(Comment.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentId: String, commentText: String, userId: String, postId: String, userName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "comments", "comment_id": commentId, "comment_text": commentText, "user_id": userId, "post_id": postId, "user_name": userName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var comment: Comment {
          get {
            return Comment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct User: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment User on users {
      __typename
      user_email
      user_id
      user_name
      likes
    }
    """

  public static let possibleTypes: [String] = ["users"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_email", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_name", type: .nonNull(.scalar(String.self))),
      GraphQLField("likes", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(userEmail: String, userId: String, userName: String, likes: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "users", "user_email": userEmail, "user_id": userId, "user_name": userName, "likes": likes])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var userEmail: String {
    get {
      return resultMap["user_email"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_email")
    }
  }

  public var userId: String {
    get {
      return resultMap["user_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_id")
    }
  }

  public var userName: String {
    get {
      return resultMap["user_name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_name")
    }
  }

  public var likes: String? {
    get {
      return resultMap["likes"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "likes")
    }
  }
}

public struct Comment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Comment on comments {
      __typename
      comment_id
      comment_text
      user_id
      post_id
      user_name
    }
    """

  public static let possibleTypes: [String] = ["comments"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("comment_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("comment_text", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_name", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(commentId: String, commentText: String, userId: String, postId: String, userName: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "comments", "comment_id": commentId, "comment_text": commentText, "user_id": userId, "post_id": postId, "user_name": userName])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var commentId: String {
    get {
      return resultMap["comment_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "comment_id")
    }
  }

  public var commentText: String {
    get {
      return resultMap["comment_text"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "comment_text")
    }
  }

  public var userId: String {
    get {
      return resultMap["user_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_id")
    }
  }

  public var postId: String {
    get {
      return resultMap["post_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "post_id")
    }
  }

  public var userName: String? {
    get {
      return resultMap["user_name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_name")
    }
  }
}

public struct Post: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Post on posts {
      __typename
      post_id
      post_text
      user_id
      user_name
      likes
      date
      image_link
    }
    """

  public static let possibleTypes: [String] = ["posts"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("post_text", type: .scalar(String.self)),
      GraphQLField("user_id", type: .scalar(String.self)),
      GraphQLField("user_name", type: .scalar(String.self)),
      GraphQLField("likes", type: .scalar(String.self)),
      GraphQLField("date", type: .scalar(String.self)),
      GraphQLField("image_link", type: .scalar(String.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(postId: String, postText: String? = nil, userId: String? = nil, userName: String? = nil, likes: String? = nil, date: String? = nil, imageLink: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "posts", "post_id": postId, "post_text": postText, "user_id": userId, "user_name": userName, "likes": likes, "date": date, "image_link": imageLink])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var postId: String {
    get {
      return resultMap["post_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "post_id")
    }
  }

  public var postText: String? {
    get {
      return resultMap["post_text"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "post_text")
    }
  }

  public var userId: String? {
    get {
      return resultMap["user_id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_id")
    }
  }

  public var userName: String? {
    get {
      return resultMap["user_name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_name")
    }
  }

  public var likes: String? {
    get {
      return resultMap["likes"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "likes")
    }
  }

  public var date: String? {
    get {
      return resultMap["date"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "date")
    }
  }

  public var imageLink: String? {
    get {
      return resultMap["image_link"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "image_link")
    }
  }
}

public struct LikeForPost: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment LikeForPost on likes {
      __typename
      post_id
      user_id
    }
    """

  public static let possibleTypes: [String] = ["likes"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("post_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("user_id", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(postId: String, userId: String) {
    self.init(unsafeResultMap: ["__typename": "likes", "post_id": postId, "user_id": userId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var postId: String {
    get {
      return resultMap["post_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "post_id")
    }
  }

  public var userId: String {
    get {
      return resultMap["user_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "user_id")
    }
  }
}
