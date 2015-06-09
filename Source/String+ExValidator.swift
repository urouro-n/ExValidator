//
//  String+ExValidator.swift
//  ExValidator
//
//  Created by Kenta Nakai on 2015/06/04.
//  Copyright (c) 2015 UROURO. All rights reserved.
//

import Foundation

extension String : Validatable {
    public func validate(rules: [ValidateRule]) -> Bool {
        for rule: ValidateRule in rules {
            switch rule {
            case .Required:
                
                if self.isEmpty {
                    return false
                }
                
            case .Min(let min):
                
                if count(self) < min {
                    return false
                }
                
            case .Max(let max):
                
                if count(self) > max {
                    return false
                }
                
            case .Email:
                
                var error: NSError? = nil
                let regex: NSRegularExpression? = NSRegularExpression(
                    pattern: "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$",
                    options: NSRegularExpressionOptions.allZeros,
                    error: nil)
                
                if let r = regex {
                    let numberOfMatches: Int = r.numberOfMatchesInString(self, options: NSMatchingOptions.allZeros, range: NSMakeRange(0, count(self)))
                    
                    if numberOfMatches <= 0 {
                        return false
                    }
                    
                    return true
                }
                
                return false
                
            case .URL:
                
                let regex: NSRegularExpression? = NSRegularExpression(
                    pattern: "^(https?://)?([-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*))$",
                    options: NSRegularExpressionOptions.allZeros,
                    error: nil)
                
                if let r = regex {
                    let numberOfMatches: Int = r.numberOfMatchesInString(self, options: NSMatchingOptions.allZeros, range: NSMakeRange(0, count(self)))
                    
                    if numberOfMatches <= 0 {
                        return false
                    }
                    
                    return true
                }
            }
        }
        
        return true
    }
}
