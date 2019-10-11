//
//  ViewController.swift
//  mzhurba2019
//
//  Created by gloomikon on 10/11/2019.
//  Copyright (c) 2019 gloomikon. All rights reserved.
//

import UIKit
import mzhurba2019

class ViewController: UIViewController {
    let manager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let article1 = manager.newArticle()
        article1.title = "1st"
        article1.content = "Hello World!"
        article1.language = "en"
        article1.created_at = NSDate()
        article1.updated_at = NSDate()
        print(article1)
        
        let article2 = manager.newArticle()
        article2.title = "2nd"
        article2.content = "Hello everybody, listen to my story!"
        article2.language = "en"
        article2.created_at = NSDate()
        article2.updated_at = NSDate()
        print(article2)
        
        let article3 = manager.newArticle()
        article3.title = "3rd"
        article3.content = "Всем моим братьм - салам!"
        article3.language = "ru"
        article3.created_at = NSDate()
        article3.updated_at = NSDate()
        print(article3)
        
        print("All:")
        print(manager.getAllArticles())
        
        print("With 'hello':")
        print(manager.getArticles(containString: "Hello"))
        
        print("ru language:")
        print(manager.getArticles(withLang: "ru"))
        
        manager.save()
        
    }
}
