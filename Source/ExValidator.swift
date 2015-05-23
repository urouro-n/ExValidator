import Foundation

public enum ValidateRule {
    case Required
    case Min(Int)
    case Max(Int)
}

public protocol Validatable {
    func validate(rules: [ValidateRule]) -> Bool
}

extension String : Validatable {
    public func validate(rules: [ValidateRule]) -> Bool {
        for rule: ValidateRule in rules {
            switch rule {
            case .Required:
                if self.isEmpty { return false }
            case .Min(let min):
                if count(self) < min { return false }
            case .Max(let max):
                if count(self) > max { return false }
            }
        }

        return true
    }
}

extension Int : Validatable {
    public func validate(rules: [ValidateRule]) -> Bool {
        for rule: ValidateRule in rules {
            switch rule {
            case .Required:
                break
            case .Min(let min):
                if self < min { return false }
            case .Max(let max):
                if self > max { return false }
            }
        }

        return true
    }
}

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
            }
        }

        return true
    }
}
