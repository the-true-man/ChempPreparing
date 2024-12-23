//
//  String.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import Foundation

extension String {
    func validateEmail() -> Bool {
        let emailRegex = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    func validatePassword() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count>=8
    }
}
