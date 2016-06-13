//
//  AddPostVC.swift
//  myLittleHood
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    
    @IBOutlet weak var PostImg: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PostImg.layer.cornerRadius = PostImg.frame.size.width / 2
        PostImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func cancelBtnPressed(sender: AnyObject!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let title = titleField.text , let desc = descField.text, let img = PostImg.image{
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        PostImg.image = image
    }
    
    
}
