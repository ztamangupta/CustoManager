//
//  CustomersView.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import SwiftUI

struct CustomersView: View {

    // MARK: Dependencies

    @EnvironmentObject var model: CustomersViewModel

    @Environment(\.managedObjectContext) var viewContext

    // MARK: Private Properties

    private let buttonSize: CGFloat = 20

    private let organizationBarHeight: CGFloat = 30

    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                organizationBar
                    .frame(height: organizationBarHeight)

                customerList
                    .navigationTitle("customers_view_title")
                    .navigationBarTitleDisplayMode(.large)
            }
        }
        .navigationViewStyle(.stack)
    }

    private var organizationBar: some View {
        HStack(spacing: 5) {
            searchFilterField

            sortByButton

            sortOrderButton
        }
        .padding(20)
    }

    private var customerList: some View {
        VStack {
            CustomerListView(filterString: model.filterString, sortBy: model.sortBy, sortOrder: model.sortOrder) { (customer: Customer) in

                NavigationLink(destination: OpportunitiesView(customer: customer)
                    .onAppear(perform: model.clearSearch)) {
                        CustomerView(customer: customer, isDetailedView: false)
                            .padding(10)
                    }
            }
        }
    }

    private var searchFilterField: some View {
        TextField("customers_view_search_placeholder", text: $model.filterString)
    }

    private var sortByButton: some View {
        Menu {
            sortByMenu
        } label: {
            Image.sort
                .resizable()
                .scaledToFit()
                .foregroundColor(.amethyst)
                .frame(width: buttonSize, height: buttonSize)
        }
    }

    private var sortOrderButton: some View {
        Button(action: {
            model.toggleSortOrder()
        }) {
            ZStack {
                if model.sortOrder == .ascending {
                    Image.ascending
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.amethyst)
                } else {
                    Image.descending
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.amethyst)
                }
            }
            .frame(width: buttonSize, height: buttonSize)
        }
    }

    private var sortByMenu: some View {
        VStack {
            ForEach(SortBy.allCases, id: \.rawValue) { sortBy in
                Button {
                    model.updateSortBy(sortBy)
                } label: {
                    Text(sortBy.rawValue)
                }
            }
        }
        .padding(.top, buttonSize)
    }
}

struct CustomersView_Previews: PreviewProvider {
    static var previews: some View {
        CustomersView()
    }
}
