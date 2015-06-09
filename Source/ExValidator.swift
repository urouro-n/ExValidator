import Foundation

public enum ValidateRule {
    case Required
    case Min(Int)
    case Max(Int)
    case Email
    case URL
}

public protocol Validatable {
    func validate(rules: [ValidateRule]) -> Bool
}
