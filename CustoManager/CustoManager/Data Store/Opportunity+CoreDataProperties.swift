//
//  Opportunity+CoreDataProperties.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//
//

import Foundation
import CoreData


extension Opportunity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Opportunity> {
        return NSFetchRequest<Opportunity>(entityName: "Opportunity")
    }

    @NSManaged public var name: String?
    @NSManaged public var status: String?
    @NSManaged public var customer: Customer?

    public var opportunityName: String {
        name ?? "Unknown"
    }

    public var opportunityStatus: OpportunityStatus {
        get {
            if let status = OpportunityStatus(rawValue: self.status ?? "") {
                return status
            } else {
                return .new
            }
        }

        set {
            self.status = newValue.rawValue
        }
    }
}

public enum OpportunityStatus: String, CaseIterable {
    case new = "New"
    case closedWon = "Closed Won"
    case closedLost = "Closed Lost"
}
