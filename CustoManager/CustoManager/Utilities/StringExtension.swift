//
//  StringExtension.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import Foundation

extension String {

    /// Return the localized value using passed in string as the localization key.
    func localized(tableName: String? = nil, comment: String = "") -> String {
        NSLocalizedString(self, tableName: tableName, comment: comment)
    }
}
