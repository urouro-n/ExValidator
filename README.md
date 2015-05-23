# ExValidator

[![CI Status](http://img.shields.io/travis/kenta.nakai/ExValidator.svg?style=flat)](https://travis-ci.org/kenta.nakai/ExValidator)
[![Version](https://img.shields.io/cocoapods/v/ExValidator.svg?style=flat)](http://cocoapods.org/pods/ExValidator)
[![License](https://img.shields.io/cocoapods/l/ExValidator.svg?style=flat)](http://cocoapods.org/pods/ExValidator)
[![Platform](https://img.shields.io/cocoapods/p/ExValidator.svg?style=flat)](http://cocoapods.org/pods/ExValidator)

A validation library for Swift

## Example

```swift
struct Model {
    var name: String
    var age: Int

    init() {
        name = ""
        age = 0
    }
}

func validateData (data: Model) -> Bool {
    if data.name.validate([.Required]) &&
       data.age.validate([.Min(20)])
    {
        return true
    }

    return false
}

var data: Model = Model()
validateData(data) // should be false

data = Model()
data.name = "Name"
data.age = 20
validateData(data) // should be true
```

## Rules

- `.Required`
- `.Min(min :Int)`
- `.Max(max :Int)`

WIP
Multiple rules doesn't work yet.

## License

ExValidator is available under the MIT license. See the LICENSE file for more info.
