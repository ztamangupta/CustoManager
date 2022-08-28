//
//  CustomerListView.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import CoreData
import SwiftUI

struct CustomerListView<T: NSManagedObject, Content: View>: View {

    @FetchRequest var fetchRequest: FetchedResults<T>

    let content: (T) -> Content

    init(filterString: String, sortBy: SortBy, sortOrder: SortOrder, @ViewBuilder content: @escaping (T) -> Content) {

        var sortDescriptor: NSSortDescriptor
        let isAscending = sortOrder == .ascending

        // Set sort descriptor.
        switch sortBy {
        case .id:
            sortDescriptor = NSSortDescriptor(keyPath: \Customer.id, ascending: isAscending)
        case .name:
            sortDescriptor = NSSortDescriptor(keyPath: \Customer.name, ascending: isAscending)
        case .status:
            sortDescriptor = NSSortDescriptor(keyPath: \Customer.status, ascending: isAscending)
        }

        if !filterString.isEmpty {
            // Predicates to filter search field by id/name/status.
            let idPredicate = NSPredicate(format: "id CONTAINS[c] %@", filterString)
            let namePredicate = NSPredicate(format: "name CONTAINS[c] %@", filterString)
            let statusPredicate = NSPredicate(format: "status CONTAINS[c] %@", filterString)

            // Update fetchreuqest based on passed in sort and filter parameters.
            _fetchRequest = FetchRequest<T>(sortDescriptors: [sortDescriptor],
                                            predicate: NSCompoundPredicate(orPredicateWithSubpredicates: [idPredicate, namePredicate, statusPredicate]))
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: [sortDescriptor])
        }
        self.content = content
    }

    var body: some View {
        List(fetchRequest, id: \.self) { customer in
            self.content(customer)
        }
    }
}
