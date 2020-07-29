//
//  meme.swift
//  MemeThrower
//
//  Created by Sai Balaji on 28/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import Foundation

public struct Json4Swift_Base : Codable {
public    let memes : [Memes]?

  public   enum CodingKeys: String, CodingKey {

        case memes = "memes"
    }

   public  init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        memes = try values.decodeIfPresent([Memes].self, forKey: .memes)
    }

}


public struct Memes : Codable {
 public    let image : String?
   public  let url : String?

   public  enum CodingKeys: String, CodingKey {

        case image = "image"
        case url = "url"
    }

 public    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
