//
//  Bool+ExValidator.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/04.
//  Copyright (c) 2015 UROURO. All rights reserved.
//

import Foundation

extension Bool : Validatable {
    public func validate(rules: [ValidateRule]) -> Bool {
        for rule: ValidateRule in rules {
            switch rule {
            case .Required:
                
                break
                
            case .Min(let min):
                
                break
                
            case .Max(let max):
                
                break
                
            case .Email:
                
                return false
                
            }
        }
        
        return true
    }
}
