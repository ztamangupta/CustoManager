//
//  OpportunityFormView.swift
//  CustoManager
//
//  Created by Aman Gupta on 27/08/22.
//

import SwiftUI

struct OpportunityFormView: View {

    // MARK: Dependencies

    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var model: OpportunitiesViewModel

    // MARK: Public Properties

    @ObservedObject var customer: Customer

    let isNewOpportunity: Bool

    // MARK: Private Properties

    @State private var name: String

    @State private var status: OpportunityStatus

    @State private var opportunity: Opportunity?

    // MARK: Life Cycle

    init(customer: Customer, isNewOpportunity: Bool, opportunity: Opportunity?) {
        self.customer = customer
        self.isNewOpportunity = isNewOpportunity
        _opportunity = State(initialValue: opportunity)
        
        if !isNewOpportunity, let opportunity = opportunity {
            _name = State(initialValue: opportunity.opportunityName)
            _status = State(initialValue: opportunity.opportunityStatus)
        } else {
            _name = State(initialValue: "")
            _status = State(initialValue: .new)
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            nameView

            statusView

            Spacer()

            submit
                .padding(.bottom, 50)
        }
        .foregroundColor(.white)
        .background(Color.black)
    }

    private var nameView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("opportunity_name")

            TextField(isNewOpportunity ? "opportunity_name_placeholder".localized() : name, text: $name)
        }
        .padding()
    }

    private var statusView: some View {
        VStack(alignment: .leading, spacing: 10) {

            HStack {
                Text("opportunity_status")

                Spacer()
            }

            Picker("", selection: $status) {
                ForEach(OpportunityStatus.allCases, id: \.rawValue) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(.segmented)
            .colorMultiply(.white)
        }
        .padding()
    }

    private var submit: some View {
        Button {
            model.saveNewOpportunity(customer: customer, name: name, status: status, opportunity: opportunity)
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("opportunity_save")
                .padding(10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.offWhite, lineWidth: 0.5)
        }
    }
}
