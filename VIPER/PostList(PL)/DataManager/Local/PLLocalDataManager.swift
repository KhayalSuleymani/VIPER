//
//  PLLocalDataManager.swift
//  VIPER
//
//  Created by ABA IT on 1/23/18.
//  Copyright © 2018 ABA IT. All rights reserved.
//

import Foundation
import CoreData

class PLLocalDataManager : PLLocalDataManagerInputProtocol {
   
    func retrievePostList() throws -> [Post] {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request : NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        return try managedObjectContext.fetch(request)
    }
    
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws {
        
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: String(describing: Post.self) , in: managedObjectContext) {
            
            let post = Post(entity: newPost , insertInto: managedObjectContext)
            post.id = Int32(id)
            post.title = title
            post.imageURL = imageUrl
            post.thumbImageURL = thumbImageUrl
            try managedObjectContext.save()
            print("Data saved...")
        }
        
    }
    
}









