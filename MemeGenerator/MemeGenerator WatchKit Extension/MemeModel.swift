//
//  MemeModel.swift
//  MemeGenerator WatchKit Extension
//
//  Created by Sai Balaji on 30/07/20.
//  Copyright © 2020 Sai Balaji. All rights reserved.
//

import Foundation

public struct Welcome: Codable {
    public let memes: [Meme]
}

// MARK: - Meme
public struct Meme: Codable {
    public let image: String
    public let url: String?
}

