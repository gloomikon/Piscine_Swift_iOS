//
//  APITwitterDelegate.swift
//  d04
//
//  Created by Mykola ZHURBA on 10/5/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    func processTweets(tweets: [Tweet])
    func handleError(error: NSError)
}
