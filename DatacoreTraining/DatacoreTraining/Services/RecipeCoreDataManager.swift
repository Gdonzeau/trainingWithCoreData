//
//  RecipeCoreDataManager.swift
//  DatacoreTraining
//
//  Created by Guillaume Donzeau on 10/08/2021.
//

import Foundation
import UIKit
import CoreData

class RecipeCoreDataManager {
    private let viewContext: NSManagedObjectContext
    static let shared = RecipeCoreDataManager()
    init(persistentContainer: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer) {
        self.viewContext = persistentContainer.viewContext
    }
}
