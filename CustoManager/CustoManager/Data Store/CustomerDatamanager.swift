//
//  CustomerDatamanager.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import CoreData

struct CustomerDataManager {

    // MARK: Public Properties

    static let shared = CustomerDataManager()

    let container: NSPersistentContainer

    let context: NSManagedObjectContext

    // MARK: Private Properties

    private let customersContainer = "CustomersContainer"

    // MARK: Life Cycle
    
    init() {
        container = NSPersistentContainer(name: customersContainer)
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error_loading_data".localized() + " " + error.localizedDescription)
            }
        }

        context = container.viewContext
    }

    /// Attempts to save changed data to data container.
    func saveData() {
        do {
            try context.save()
        } catch let error {
            print("error_saving_data".localized() + " " + error.localizedDescription)
        }
    }
}


