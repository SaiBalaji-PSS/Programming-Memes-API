//
//  NetworkService.swift
//  MemeGenerator WatchKit Extension
//
//  Created by Sai Balaji on 30/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import Foundation


public class NetworkService
{
    public static let sharedobj = NetworkService()
    
    let url = URL(string: "https://programmermemes.herokuapp.com/")
    let session = URLSession(configuration: .default)
    
    
    public func getMemes(onSuccess:@escaping(Welcome)->Void)
    {
        let task = session.dataTask(with:url!) { (data, reponse, error) in
            
            DispatchQueue.main.async {
                
                do
                {
                    let items = try JSONDecoder().decode(Welcome.self, from: data!)
                    onSuccess(items)
                    
                }
                
                catch{
                    print(error)
                }
                
                
            }
            
            
            
        }
        
        task.resume()
    }

}
