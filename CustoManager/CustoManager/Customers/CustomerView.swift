//
//  CustomerView.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import SwiftUI

struct CustomerView: View {
    
    @EnvironmentObject var model: CustomersViewModel
    
    // MARK: Public Properties
    
    @ObservedObject var customer: Customer
    
    let isDetailedView: Bool
    
    // MARK: Private Properties
    
    private var rowHeight: CGFloat {
        var height: CGFloat = 80
        if isDetailedView {
            height += height * 0.5
        }
        return height
    }
    
    private var currentStatus: Binding<CustomerStatus> {
        Binding(get: {
            customer.customerStatus
        }) { newValue in
            model.customerStatus = newValue
        }
    }
    
    private let imageWidth: CGFloat = 70

    var body: some View {
        VStack(alignment: .leading) {
            profile
            
            details
        }
        .font(.system(size: 15))
    }
    
    private var profile: some View {
        HStack(spacing: 20) {
            Image.profile
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .linearGradient(colors: [.amethyst, .offWhite, .amethyst], startPoint: .leading, endPoint: .trailing))

            VStack(alignment: .leading) {
                Text("customer_id".localized()).bold() + Text("\(customer.id)").monospacedDigit()
                Text("customer_name".localized()).bold() + Text(customer.customerName)
                if isDetailedView {
                    Text("customer_contact_details".localized()).bold() + Text(customer.customerContactDetail)
                }
            }
            .lineLimit(2)
        }
        .frame(height: rowHeight)
    }
    
    private var details: some View {
        VStack(alignment: .leading) {
            if !isDetailedView {
                Text("customer_status".localized()).bold() + Text(customer.customerStatus.rawValue)
            } else {
                editStatusView
                Text("customer_created_on".localized()).bold() + Text(customer.customerCreationTime)
            }
        }
    }
    
    private var editStatusView: some View {
        Menu {
            VStack {
                ForEach(CustomerStatus.allCases, id: \.rawValue) { status in
                    Button {
                        model.updateCustomerStatus(customer: customer, status: status)
                    } label: {
                        Text(status.rawValue)
                    }
                }
            }
        } label: {
            Text(customer.customerStatus.rawValue)
        }
    }
}
