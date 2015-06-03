import Foundation

public enum ValidateRule {
    case Required
    case Min(Int)
    case Max(Int)
    case Email
}

public protocol Validatable {
    func validate(rules: [ValidateRule]) -> Bool
}
