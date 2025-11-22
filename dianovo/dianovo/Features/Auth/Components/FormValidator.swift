//
//  FormValidator.swift
//  dianovo
//
//  Created by Emilia Kościelniak on 22/11/2025.
//


import Foundation

struct FormValidator {
    
    static func validate(
        email: String? = nil,
        password: String? = nil,
        repeatPassword: String? = nil,
        isChecked: Bool? = nil
    ) -> [String: String] {
        var errors: [String: String] = [:]
        
        if let email = email {
            errors["email"] = isValidEmail(email) ? "" : "Invalid email format"
        }
        
        if let password = password {
            errors["password"] = password.count >= 6 ? "" : "Password must be at least 6 characters"
        }
        
        if let repeatPassword = repeatPassword, let password = password {
            errors["repeat"] = repeatPassword == password ? "" : "Passwords do not match"
        }
        
        if let isChecked = isChecked {
            errors["global"] = isChecked ? "" : "You must accept the terms"
        }
        
        return errors
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
