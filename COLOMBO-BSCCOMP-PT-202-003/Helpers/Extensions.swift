//
//  Extensions.swift
//  COLOMBO-BSCCOMP-PT-202-003
//
//  Created by Sahan Ruwanga on 2022-04-15.
//
//Last Commit
import Foundation
//Regex Validation As String Extentsions

extension String {
    var isValidContact: Bool {
        let phoneNumberRegex = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
    var isValidNIC: Bool {
        let nicRegex = "^\\d{9}$"
        let nicTest = NSPredicate(format: "SELF MATCHES %@", nicRegex)
        let isValidNIC = nicTest.evaluate(with: self)
        return isValidNIC
    }
}
