//
//  ViewController.swift
//  MemeThrower
//
//  Created by Sai Balaji on 28/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import UIKit

class MemeVC: UIViewController {

    @IBOutlet weak var progressindicator: UIActivityIndicatorView!
    
    @IBOutlet weak var generatebtn: Custombtn!
    @IBOutlet weak var memeimageview: UIImageView!
    var memes = [Memes]()
    
    @IBOutlet weak var sbtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressindicator.isHidden = true
    
       
    
        
        
        memeimageview.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        memeimageview.layer.borderWidth = 2
        memeimageview.layer.cornerRadius = 2
        
        
        
        NetworkService.sharedobj.getMemes { (m, err) in
            
            self.memes = m
            
            print(self.memes.first!.image!)
    
           
        }
        
        if memeimageview.image == nil
        {
            sbtn.isEnabled = false
        }
        
        
    
        
        
    
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        
        if let data = memeimageview.image?.jpegData(compressionQuality: 0.9)
        {
            let vc = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            
            vc.popoverPresentationController?.barButtonItem = sbtn
            present(vc, animated: true, completion: nil)
        }
        
      
        
    }
   

    @IBAction func generatebtnclicked(_ sender: Any) {
        
        memes.shuffle()
        
        
        guard let imageurl = memes.first!.url else {
            return
        }
        sbtn.isEnabled = true
        
        progressindicator.isHidden = false
       
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let i = try? Data(contentsOf: URL(string: imageurl)!)
            {
                DispatchQueue.main.async {
                    if let image = UIImage(data: i)
                    {
                        self.memeimageview.image = image
                        self.progressindicator.isHidden = true
                       
                    }
                }
                 
            }
        }
        
        
    }
    
}

