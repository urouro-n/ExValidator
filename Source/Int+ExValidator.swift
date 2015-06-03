//
//  Int+ExValidator.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/04.
//  Copyright (c) 2015 UROURO. All rights reserved.
//

import Foundation

extension Int : Validatable {
    public func validate(rules: [ValidateRule]) -> Bool {
        for rule: ValidateRule in rules {
            switch rule {
            case .Required:
                
                break
                
            case .Min(let min):
                
                if self < min {
                    return false
                }
                
            case .Max(let max):
                
                if self > max {
                    return false
                }
                
            case .Email:
                
                return false
                
            }
        }
        
        return true
    }
}
