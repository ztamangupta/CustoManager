//
//  Customer+CoreDataProperties.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//
//

import Foundation
import CoreData


extension Customer {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }
    
    @NSManaged public var contactDetail: String?
    @NSManaged public var name: String?
    @NSManaged public var creationTime: Date?
    @NSManaged public var status: String?
    @NSManaged public var id: Int32
    @NSManaged public var opportunities: NSSet?
    
    public var customerContactDetail: String {
        contactDetail ?? "Unknown"
    }
    
    public var customerName: String {
        name ?? "Unknown"
    }
    
    public var customerCreationTime: String {
        (creationTime ?? Date(timeIntervalSinceNow: 0)).toString()
    }
    
    public var customerStatus: CustomerStatus {
        get {
            if let status = CustomerStatus(rawValue: self.status ?? "") {
                return status
            } else {
                return .active
            }
        }
        
        set {
            self.status = newValue.rawValue
        }
    }
    
    public var customerOpportunities: [Opportunity] {
        let set = opportunities as? Set<Opportunity> ?? []
        
        return set.sorted {
            $0.opportunityName < $1.opportunityName
        }
    }
}

public enum CustomerStatus: String, CaseIterable {
    case active = "Active"
    case nonActive = "Non-Active"
    case lead = "Lead"
}
