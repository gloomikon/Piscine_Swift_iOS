//
//  ArticleManager.swift
//  mzhurba2019
//
//  Created by Mykola ZHURBA on 10/11/19.
//

import Foundation
import CoreData

import UIKit
import CoreData

public class ArticleManager {
    
    public init () {
    }
    
    public let context: NSManagedObjectContext = {
        let urlsFM = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let appDocDirectory = urlsFM.last!
        let bundle = Bundle(for: ArticleManager.self)
        let modelURL = bundle.url(forResource: "article", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        let url = appDocDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        try! coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    public func save() {
        do {
            try context.save()
        } catch let error {
            print ("Errror \(error.localizedDescription)")
        }
    }
    
    public func newArticle() -> Article {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: context) as! Article
    }
    
    public func getAllArticles() -> [Article] {
        var articles: [Article]!
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        context.performAndWait {
            articles = try! self.context.fetch(request) as! [Article]
        }
        return articles
    }
    
    public func getArticles(withLang lang: String) -> [Article] {
        var articles: [Article] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "language==%@", lang)
        do {
            try articles = self.context.fetch(request) as! [Article]
        } catch let error as NSError {
            print ("Errror \(error.localizedDescription)")
        }
        return articles
    }
    
    public func getArticles(containString str: String) -> [Article] {
        var articles: [Article] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        request.predicate = NSPredicate(format: "content CONTAINS[C] %@", str)
        do {
            try articles = context.fetch(request) as! [Article]
        } catch let error as NSError {
            print ("Error \(error.localizedDescription)")
        }
        return articles
    }
    
    public func removeArticle(_ article: Article) {
        context.delete(article)
        self.save()
    }
}
