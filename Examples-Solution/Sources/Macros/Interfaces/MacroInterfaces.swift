// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation


// MARK: - URL Expression Macro

@freestanding(expression)
public macro URL(_ s: String) -> URL = #externalMacro(
    module: "MacrosImplementation",
    type: "URLMacro"
)




// MARK: - DiscardableResult MemberAttribute Macro

@attached(memberAttribute)
public macro DiscardableResult() = #externalMacro(
    module: "MacrosImplementation",
    type: "DiscardableResultMacro"
)




// MARK: - DictionaryStorage Complex Macro

@attached(member, names: named(_storage), named(init))
@attached(extension, conformances: DictionaryRepresentable)
public macro DictionaryStorage() = #externalMacro(
    module: "MacrosImplementation",
    type: "DictionaryStorageMacro"
)


public protocol DictionaryRepresentable {
    var _storage: [String: Any] { get set }
    init(_ storage: [String: Any])
}
