//
//  DataService.swift
//  myLittleHood
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    let KEY_POSTS = "posts"
    private var _loadedPost = [Post]()
    
    var loadedPost: [Post]{
        return _loadedPost
    }
    
    
    func savePosts(){
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPost)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        
    }
    
    func loadPosts(){
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData{
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post]{
                _loadedPost = postsArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object:nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png)"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post){
        _loadedPost.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
}