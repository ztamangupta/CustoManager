//
//  OpportunitiesViewModel.swift
//  CustoManager
//
//  Created by Aman Gupta on 27/08/22.
//

import CoreData
import Foundation

class OpportunitiesViewModel: ObservableObject {

    // MARK: Private Properties

    @Published var showOverlay = false

    @Published var isNewOpportunity = false

    @Published var opportunity: Opportunity?

    // MARK: Private Properties

    private let manager = CustomerDataManager.shared

    // MARK: Public Methods

    /// Shows oppotunity form view with empty fields to allow fresh opportunity addition.
    func addOpportunity() {
        isNewOpportunity = true
        showOverlay = true
    }

    /// Shows oppotunity form view with currently saved fields to allow edition of this opportunity..
    func editOpportunity(opportunity: Opportunity) {
        isNewOpportunity = false
        self.opportunity = opportunity
        showOverlay = true
    }

    /// Adds and saves the new/existing opportunity to the specified customer.
    func saveNewOpportunity(customer: Customer, name: String, status: OpportunityStatus, opportunity: Opportunity?) {
        var currentOpportunity: Opportunity

        if !isNewOpportunity, let opportunity = opportunity {
            currentOpportunity = opportunity
        } else {
            currentOpportunity = Opportunity(context: manager.context)
        }

        currentOpportunity.name = name
        currentOpportunity.opportunityStatus = status
        currentOpportunity.customer = customer
        manager.saveData()
    }
}
