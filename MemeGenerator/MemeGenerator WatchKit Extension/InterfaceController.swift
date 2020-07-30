//
//  InterfaceController.swift
//  MemeGenerator WatchKit Extension
//
//  Created by Sai Balaji on 30/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController,WKCrownDelegate {

    var memearray = [Meme]()
    
    @IBOutlet weak var memeimageView: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        crownSequencer.delegate = self
        
        NetworkService.sharedobj.getMemes { (W) in
            self.memearray = W.memes
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        crownSequencer.focus()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        
        memearray.shuffle()
        
        if let m = memearray.first
        {
            if let u = m.url
            {
                  DonwloadImage(url: u)
            }
            
            else
            {
                DonwloadImage(url: memearray[1].url!)
            }
            
          
            
        }
        
        else
        {
           // print(memearray[2].url!)
        }
        
        
        
    }
    
    
    
    func DonwloadImage(url: String)
    {
        DispatchQueue.global(qos: .userInteractive).async {
            if let data = try? Data(contentsOf: URL(string: url)!)
            {
                if let i = UIImage(data: data)
                {
                    self.memeimageView.setImage(i)
                }
            }
        }
    }
}
