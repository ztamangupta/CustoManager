//
//  CustomersViewModel.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import CoreData
import SwiftUI

class CustomersViewModel: ObservableObject {

    // MARK: Public Properties

    @Published var filterString = ""

    @Published var sortOrder: SortOrder = .ascending

    @Published var sortBy: SortBy = .id

    @Published var customerStatus: CustomerStatus?

    // MARK: Private Properties

    private let manager = CustomerDataManager.shared

    // MARK: Life Cycle

    init() {
        // TODO: Uncomment this to create a sample of customers.
        /*for index in 0...10 {
            addCustomer(index)
        }*/
    }

    // MARK: Public Methods

    /// Toggles sort order between ascending and descending.
    func toggleSortOrder() {
        withDefaultAnimation {
            if sortOrder == .ascending {
                sortOrder = .descending
            } else {
                sortOrder = .ascending
            }
        }
    }

    /// Updates the sort by criteria.
    func updateSortBy(_ sortBy: SortBy) {
        withDefaultAnimation {
            self.sortBy = sortBy
        }
    }

    /// Updates the passed in customer's status.
    func updateCustomerStatus(customer: Customer, status: CustomerStatus) {
        customer.customerStatus = status
        manager.saveData()
    }

    /// Clears the current search string.
    func clearSearch() {
        if !filterString.isEmpty {
            filterString = ""
        }
    }

    // MARK: Private Methods

    /// Adds a customer to the data storage with predefined values.
    private func addCustomer(_ index: Int) {
        let newCustomer = Customer(context: manager.context)
        newCustomer.name = "Customer \(index)"
        newCustomer.id = Int32(index)
        newCustomer.creationTime = Calendar.current.date(byAdding: .hour, value: index, to: Date())
        newCustomer.contactDetail = String("+64 \(index)\(index)\(index)\(index)\(index)")
        var status: CustomerStatus
        if index % 3 == 0 {
            status = .lead
        } else if index % 2 == 0 {
            status = .nonActive
        } else {
            status = .active
        }
        newCustomer.status = status.rawValue
        manager.saveData()
    }
}

enum SortOrder {
    case ascending
    case descending
}

enum SortBy: String, CaseIterable {
    case id = "ID"
    case name = "Name"
    case status = "Status"
}
