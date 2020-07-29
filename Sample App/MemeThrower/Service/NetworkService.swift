//
//  NetworkService.swift
//  MemeThrower
//
//  Created by Sai Balaji on 28/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import Foundation


public class NetworkService
{
    
  public  static let sharedobj = NetworkService()
    
  public  let url = URL(string:"http://127.0.0.1:8080")
    
  public   let session = URLSession(configuration: .default)
    
 public func getMemes(onSucces:@escaping([Memes],Error?)->Void)
    {
       let task = session.dataTask(with: url!) { (data, response, error) in
            
            
        DispatchQueue.main.async {
            do
                       {
                           
                           print(data!)
                           let items = try JSONDecoder().decode(Json4Swift_Base.self, from: data!)
                        onSucces(items.memes!,error)
                       }
                       catch
                       {
                           print(error)
                       }
        }
        
           
            
            
            
            
        }
        task.resume()
        
    }
    
}
