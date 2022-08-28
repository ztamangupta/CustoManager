//
//  DateExtension.swift
//  CustoManager
//
//  Created by Aman Gupta on 22/08/22.
//

import Foundation

extension Date {

    /// Return the string representation of this date in "HH:mm E, d MMM y" format.
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: self)
    }
}
