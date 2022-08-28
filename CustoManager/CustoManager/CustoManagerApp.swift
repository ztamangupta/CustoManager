//
//  CustoManagerApp.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import SwiftUI
import CoreData

@main
struct CustoManagerApp: App {

    // MARK: Dependencies

    let customersModel = CustomersViewModel()

    let opportunitiesModel = OpportunitiesViewModel()

    let dataManager = CustomerDataManager.shared

    var body: some Scene {

        WindowGroup {
            CustomersView()
                .environmentObject(customersModel)
                .environmentObject(opportunitiesModel)
                .environment(\.managedObjectContext, dataManager.context)
                .environment(\.colorScheme, .dark)
                .preferredColorScheme(.dark)
        }
    }
}
