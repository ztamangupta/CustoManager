//
//  OpportunitiesView.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import SwiftUI

struct OpportunitiesView: View {

    // MARK: Dependencies

    @EnvironmentObject var model: OpportunitiesViewModel

    // MARK: Public Properties

    @ObservedObject var customer: Customer

    // MARK: Private Properties

    private let buttonSize: CGFloat = 20

    var body: some View {
        VStack(alignment: .leading) {
            customerDetails

            Divider()

            opportunities
                .padding()
        }
        .toolbar {
            Button {
                model.addOpportunity()
            } label: {
                Image.add
                    .resizable()
                    .scaledToFit()
                    .frame(width: buttonSize, height: buttonSize)
                    .foregroundColor(.amethyst)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $model.showOverlay) {
            OpportunityFormView(customer: customer, isNewOpportunity: model.isNewOpportunity, opportunity: model.opportunity)
        }
    }

    private var customerDetails: some View {
        HStack {
            CustomerView(customer: customer , isDetailedView: true)
                .padding(10)

            Spacer()
        }
    }

    private var opportunities: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(customer.customerOpportunities, id: \.self) { opportunity in
                    HStack(alignment: .top) {
                        VStack(alignment:.leading, spacing: 5) {
                            Text("opportunity_name")
                                .font(.headline)
                            Text(opportunity.opportunityName)
                                .font(.system(size: 15))
                            Text("opportunity_status")
                                .font(.headline)
                            Text(opportunity.opportunityStatus.rawValue)
                                .font(.system(size: 15))

                            Divider()
                                .padding()
                        }

                        Spacer()

                        Button {
                            model.editOpportunity(opportunity: opportunity)
                        } label: {
                            Image.edit
                                .resizable()
                                .scaledToFit()
                                .frame(width: buttonSize, height: buttonSize)
                                .foregroundColor(.amethyst)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
