//
//  Extension-String.swift
//  NewsApp
//
//  Created by Scott on 2/8/21.
//

import Foundation

extension String {
    func currencyFormat() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = .autoupdatingCurrent
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
    
    func percentFormat() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.locale = .autoupdatingCurrent
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
